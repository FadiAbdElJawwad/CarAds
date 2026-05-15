import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckoutService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentReference<Map<String, dynamic>>> submitCheckoutData(Map<String, dynamic> data) async {
    return await _firestore.collection('checkout').add(data);
  }

  Future<void> updateOrderLocation(String orderId, String location) async {
    await _firestore.collection('checkout').doc(orderId).update({
      'location': location,
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCheckoutOrder(String orderId) async {
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
