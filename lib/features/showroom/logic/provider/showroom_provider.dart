import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/features/showroom/model/booking_model.dart';
import 'package:car_ads/features/showroom/model/rent_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowroomProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NotificationService _notificationService = NotificationService();

  final List<BookingModel> _recentBookings = [];
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
          (snapshot) =>
          snapshot.docs
              .map((doc) => RentRequestModel.fromFirestore(doc))
              .toList(),
    );
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
          .where('status', isEqualTo: 'accepted')
          .get();

      double sales = 0;
      double rent = 0;

      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        final amount = (data['total_payment'] ?? 0).toDouble();
        // Assuming adType is stored in checkout or we can derive it.
        // For now, let's just categorize all as rent since the checkout flow is for rental.
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

  Future<void> updateRequestStatus(RentRequestModel request,
      String newStatus,) async {
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
        final bool isAccepted = statusLower == 'accepted';
        final bool isCompleted = statusLower == 'complete';

        String title = "We apologize, the request was denied";
        String body = "Car rental request ${request
            .carName} rejected by the showroom.";

        if (isAccepted) {
          title = "The rental request has been accepted";
          body = "The showroom has accepted a request to rent a car ${request
              .carName}. You can review the details in the record.";
        } else if (isCompleted) {
          title = "Order Completed";
          body = "Your rental for ${request
              .carName} has been marked as completed. Thank you for using our service!";
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


    Future<void> completeOrder(RentRequestModel request) async {
      await updateRequestStatus(request, 'complete');
    }
  }
}