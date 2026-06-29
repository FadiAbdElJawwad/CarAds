import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/features/showroom/model/booking_model.dart';
import 'package:car_ads/features/showroom/model/rent_request_model.dart'; // Added
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowroomProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<BookingModel> _recentBookings = [];
  bool _isLoading = false;

  List<BookingModel> get recentBookings => _recentBookings;
  bool get isLoading => _isLoading;

  Stream<List<RentRequestModel>> getRecentRentRequests(String showroomId) {
    return _firestore
        .collection('rent_requests')
        .where('showroomId', isEqualTo: showroomId)
        .orderBy('createdAt', descending: true)
        .limit(5)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => RentRequestModel.fromFirestore(doc))
              .toList(),
        );
  }

  Future<void> fetchRecentRentRequests(String showroomId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final querySnapshot = await _firestore
          .collection('bookings')
          .where('showroomId', isEqualTo: showroomId)
          .orderBy('requestDate', descending: true)
          .limit(5)
          .get();

      _recentBookings = querySnapshot.docs
          .map((doc) => BookingModel.fromFirestore(doc))
          .toList();

      AppLogger.info(
        "Fetched ${_recentBookings.length} recent rent requests for showroom: $showroomId",
      );
    } catch (e) {
      AppLogger.error("Error fetching recent rent requests: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
