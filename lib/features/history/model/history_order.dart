import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryOrder {
  final String id;
  final String carName;
  final String imageUrl;
  final DateTime rentalStart;
  final String status;

  HistoryOrder({
    required this.id,
    required this.carName,
    required this.imageUrl,
    required this.rentalStart,
    required this.status,
    required DateTime createdAt,
  });

  factory HistoryOrder.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return HistoryOrder(
      id: doc.id,
      carName: data['car_name'] ?? 'Unknown Car',
      imageUrl: data['car_image'] ?? '',
      rentalStart: data['rental_start'] is Timestamp
          ? (data['rental_start'] as Timestamp).toDate()
          : DateTime.now(),
      createdAt: data['created_at'] != null
          ? (data['created_at'] as Timestamp).toDate()
          : DateTime.now(),
      status: data['status'] ?? 'pending',
    );
  }
}
