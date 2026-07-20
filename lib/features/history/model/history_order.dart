import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/app_sizes.dart'; // Import for context.loc

class HistoryOrder {
  final String id;
  final String carName;
  final String imageUrl;
  final DateTime rentalStart;
  final String status;
  final DateTime createdAt;

  HistoryOrder({
    required this.id,
    required this.carName,
    required this.imageUrl,
    required this.rentalStart,
    required this.status,
    required this.createdAt,
  });

  factory HistoryOrder.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return HistoryOrder(
      id: doc.id,
      carName: data['car_name'] ?? 'unknownCar', // Store the key
      imageUrl: data['car_image'] ?? '',
      rentalStart: data['rental_start'] is Timestamp
          ? (data['rental_start'] as Timestamp).toDate()
          : DateTime.now(),
      createdAt: data['created_at'] != null
          ? (data['created_at'] as Timestamp).toDate()
          : DateTime.now(),
      status: data['status'] ?? 'Pending', // Store the key
    );
  }

  /// Returns the localized car name.
  /// If it's the 'unknownCar' key, it returns the translation.
  String getLocalizedCarName(BuildContext context) {
    return carName == 'unknownCar' ? context.loc.unknownCar : carName;
  }

  /// Returns the localized status based on the status key.
  String getDisplayStatus(BuildContext context) {
    switch (status.toLowerCase()) {
      case 'statuspending':
      case 'pending':
        return context.loc.statusPending;
      case 'statusconfirmed':
      case 'confirmed':
        return context.loc.statusConfirmed;
      case 'statusrejected':
      case 'rejected':
        return context.loc.statusRejected;
      default:
        return status;
    }
  }
}