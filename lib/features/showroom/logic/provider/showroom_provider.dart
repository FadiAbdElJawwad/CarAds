import 'dart:async';
import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/features/showroom/model/booking_model.dart';
import 'package:car_ads/features/showroom/model/rent_request_model.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowroomProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NotificationService _notificationService = NotificationService();

  final List<BookingModel> _recentBookings = [];
  List<RentRequestModel> _cachedRequests = [];
  Timer? _expiryTimer;
  double _salesProfit = 0;
  double _rentProfit = 0;
  bool _isLoading = false;

  List<BookingModel> get recentBookings => _recentBookings;

  double get salesProfit => _salesProfit;

  double get rentProfit => _rentProfit;

  bool get isLoading => _isLoading;

  Stream<List<RentRequestModel>> getRecentRentRequests(String showroomId, {
    int? limit = 5,
  }) {
    Query query = _firestore
        .collection('rent_requests')
        .where('showroomId', isEqualTo: showroomId)
        .orderBy('createdAt', descending: true);

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.snapshots().map(
          (snapshot) {
        final requests = snapshot.docs
            .map((doc) => RentRequestModel.fromFirestore(doc))
            .toList();

        _cachedRequests = requests;
        startExpiryTimer();
        _autoCompleteExpiredRentals(requests);

        return requests;
      },
    );
  }

  void startExpiryTimer() {
    _expiryTimer?.cancel();

    _expiryTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_cachedRequests.isNotEmpty) {
        _autoCompleteExpiredRentals(_cachedRequests);
      }
    });
  }

  Future<void> _autoCompleteExpiredRentals(
      List<RentRequestModel> requests,
      ) async {
    final now = DateTime.now();

    for (var request in requests) {
      final String status = request.status.toLowerCase().trim();
      final String purpose = request.purpose?.toLowerCase().trim() ?? '';

      if (status == 'active' && purpose == 'rent' && request.rentalEnd != null) {
        final DateTime expirationDate = request.rentalEnd!;

        if (now.isAfter(expirationDate)) {
          try {
            await _firestore
                .collection('rent_requests')
                .doc(request.id)
                .update({'status': 'complete'});

            if (request.checkoutId.isNotEmpty) {
              await _firestore
                  .collection('checkout')
                  .doc(request.checkoutId)
                  .update({'status': 'complete'});
            }

            AppLogger.info(
              "Auto-completed expired rental for ${request.carName} (ID: ${request.id})",
            );
          } catch (e) {
            AppLogger.error(
              "Lazy auto-completion failed for request ${request.id}",
              e,
            );
          }
        }
      }
    }
  }

  Future<RentRequestModel?> getRentRequestById(String requestId) async {
    try {
      final doc = await _firestore
          .collection('rent_requests')
          .where('requestId', isEqualTo: requestId)
          .limit(1)
          .get();

      if (doc.docs.isNotEmpty) {
        return RentRequestModel.fromFirestore(doc.docs.first);
      }
      return null;
    } catch (e) {
      AppLogger.error("Error fetching rent request: $e");
      return null;
    }
  }

  Future<void> fetchProfitMetrics(String showroomId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final querySnapshot = await _firestore
          .collection('checkout')
          .where('showroomID', isEqualTo: showroomId)
          .where('status', whereIn: ['accepted', 'active', 'complete'])
          .get();

      double sales = 0;
      double rent = 0;

      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        final amount = (data['total_payment'] ?? 0).toDouble();
        rent += amount;
      }

      _salesProfit = sales;
      _rentProfit = rent;

      AppLogger.info(
        "Calculated profits for showroom $showroomId: Sales: $sales, Rent: $rent",
      );
    } catch (e) {
      AppLogger.error("Error fetching profit metrics: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateRequestStatus(
    BuildContext context,
    RentRequestModel request,
    String newStatus,
  ) async {
    final loc = context.loc;
    try {
      final batch = _firestore.batch();

      batch.update(_firestore.collection('rent_requests').doc(request.id), {
        'status': newStatus,
      });

      if (request.checkoutId.isNotEmpty) {
        batch.update(
          _firestore.collection('checkout').doc(request.checkoutId),
          {'status': newStatus},
        );
      }

      await batch.commit();
      AppLogger.info("Request ${request.id} status updated to $newStatus");

      if (request.userId != null && request.userId!.isNotEmpty) {
        final String statusLower = newStatus.toLowerCase();
        final bool isAccepted = statusLower == 'accepted' || statusLower == 'active';
        final bool isCompleted = statusLower == 'complete';

        String title = loc.requestDeniedTitle;
        String body = loc.requestDeniedBody(request.carName);

        if (isAccepted) {
          title = request.isRent
              ? loc.rentalAcceptedTitle
              : loc.purchaseAcceptedTitle;
          body = request.isRent
              ? loc.rentalAcceptedBody(request.carName)
              : loc.purchaseAcceptedBody(request.carName);
        } else if (isCompleted) {
          title = loc.orderCompletedTitle;
          body = loc.orderCompletedBody(request.carName);
        }

        await _notificationService.sendNotification(
          userId: request.userId!,
          title: title,
          body: body,
          extraData: {'bookingId': request.checkoutId, 'type': 'receipt'},
        );
      }
    } catch (e) {
      AppLogger.error("Error updating request status: $e");
      rethrow;
    }
  }

  @override
  void dispose() {
    _expiryTimer?.cancel();
    super.dispose();
  }
}