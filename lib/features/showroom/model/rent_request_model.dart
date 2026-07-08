import 'package:cloud_firestore/cloud_firestore.dart';

class RentRequestModel {
  final String id; // Document ID in rent_requests
  final String checkoutId; // ID of the related checkout document
  final String carId;
  final String? userId;
  final String carName;
  final String price;
  final String customerName;
  final String status;
  final DateTime createdAt;
  final String? carImage;
  final String? nationalId;
  final String? driverLicenseNo;
  final String? phoneNumber;

  RentRequestModel({
    required this.id,
    required this.checkoutId,
    required this.carId,
    this.userId,
    required this.carName,
    required this.price,
    required this.customerName,
    required this.status,
    required this.createdAt,
    this.carImage,
    this.nationalId,
    this.driverLicenseNo,
    this.phoneNumber,
  });

  factory RentRequestModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RentRequestModel(
      id: doc.id,
      checkoutId: data['requestId'] ?? '',
      carId: data['carId'] ?? '',
      userId: data['userId'],
      carName: data['carName'] ?? 'Unknown Car',
      price: data['price']?.toString() ?? '',
      customerName: data['customerName'] ?? 'Unknown Customer',
      status: data['status'] ?? 'pending',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      carImage: data['car_image'] ?? data['carImage'],
      nationalId: data['nationalId']?.toString(),
      driverLicenseNo: data['driverLicenseNo']?.toString(),
      phoneNumber: data['phoneNumber']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'requestId': checkoutId,
      'carId': carId,
      'userId': userId,
      'carName': carName,
      'price': price,
      'customerName': customerName,
      'status': status,
      'createdAt': Timestamp.fromDate(createdAt),
      'carImage': carImage,
      'nationalId': nationalId,
      'driverLicenseNo': driverLicenseNo,
      'phoneNumber': phoneNumber,
    };
  }
}
