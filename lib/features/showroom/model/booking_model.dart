import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String id;
  final String carId;
  final String showroomId;
  final String requestedByUid;
  final String requestedByName;
  final String carName;
  final String carImage;
  final double pricePerDay;
  final DateTime requestDate;
  final String status;

  BookingModel({
    required this.id,
    required this.carId,
    required this.showroomId,
    required this.requestedByUid,
    required this.requestedByName,
    required this.carName,
    required this.carImage,
    required this.pricePerDay,
    required this.requestDate,
    required this.status,
  });

  factory BookingModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return BookingModel(
      id: doc.id,
      carId: data['carId'] ?? '',
      showroomId: data['showroomId'] ?? '',
      requestedByUid: data['requestedByUid'] ?? '',
      requestedByName: data['requestedByName'] ?? '',
      carName: data['carName'] ?? '',
      carImage: data['carImage'] ?? '',
      pricePerDay: (data['pricePerDay'] ?? 0).toDouble(),
      requestDate: (data['requestDate'] as Timestamp).toDate(),
      status: data['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'carId': carId,
      'showroomId': showroomId,
      'requestedByUid': requestedByUid,
      'requestedByName': requestedByName,
      'carName': carName,
      'carImage': carImage,
      'pricePerDay': pricePerDay,
      'requestDate': Timestamp.fromDate(requestDate),
      'status': status,
    };
  }
}
