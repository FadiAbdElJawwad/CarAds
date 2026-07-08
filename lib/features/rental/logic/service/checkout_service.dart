import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckoutService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentReference<Map<String, dynamic>>> submitCheckoutData(
    Map<String, dynamic> data, {
    required String customerName,
  }) async {
    final orderRef = await _firestore.collection('checkout').add(data);

    await _firestore.collection('rent_requests').add({
      'requestId': orderRef.id,
      'carId': data['carID'] ?? '',
      'carName': data['car_name'] ?? 'Unknown Car',
      'price': data['total_payment']?.toString() ?? '',
      'showroomId': data['showroomID'] ?? '',
      'userId': data['userId'] ?? '',
      'customerName': customerName,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
      'carImage': data['car_image'] ?? '',
      'nationalId': data['id_number'] ?? '',
      'driverLicenseNo': data['license_number'] ?? '',
      'phoneNumber': data['phone_number'] ?? '',
    });

    return orderRef;
  }

  Future<void> updateOrderLocation(String orderId, String location) async {
    await _firestore.collection('checkout').doc(orderId).update({
      'location': location,
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCheckoutOrder(
    String orderId,
  ) async {
    return await _firestore.collection('checkout').doc(orderId).get();
  }

  DateTime combineDateAndTime(DateTime date, TimeOfDay? time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time?.hour ?? 0,
      time?.minute ?? 0,
    );
  }
}
