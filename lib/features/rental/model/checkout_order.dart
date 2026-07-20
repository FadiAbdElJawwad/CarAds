import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckoutOrder {
  final String licenseNumber;
  final String idNumber;
  final String phoneNumber;
  final DateTime rentalStart;
  final DateTime rentalEnd;
  final int totalPayment;
  final String currency;
  final int shippingCost;
  final int taxCost;
  final String carName;
  final String carId;
  final String carImage;
  final int carPrice;
  final String? userEmail;
  final String? userId;
  final String? location;
  final String? showroomId;
  final String? purpose;

  CheckoutOrder({
    required this.licenseNumber,
    required this.idNumber,
    required this.phoneNumber,
    required this.rentalStart,
    required this.rentalEnd,
    required this.totalPayment,
    required this.currency,
    required this.shippingCost,
    required this.taxCost,
    required this.carName,
    required this.carId,
    required this.carImage,
    required this.carPrice,
    this.userEmail,
    this.userId,
    this.location,
    this.showroomId,
    this.purpose,
  });

  String getLocalizedCarName(BuildContext context) {
    return carName == 'unknownCar' ? context.loc.unknownCar : carName;
  }

  String getLocalizedCurrency(BuildContext context) {
    return currency == 'aed' ? context.loc.aed : currency;
  }

  Map<String, dynamic> toMap() {
    return {
      'license_number': licenseNumber,
      'id_number': idNumber,
      'phone_number': phoneNumber,
      'nationalId': idNumber,
      'driverLicenseNo': licenseNumber,
      'phoneNumber': phoneNumber,
      'rental_start': Timestamp.fromDate(rentalStart),
      'rental_end': Timestamp.fromDate(rentalEnd),
      'total_payment': totalPayment,
      'payment_currency': currency,
      'created_at': FieldValue.serverTimestamp(),
      'shipping_cost': shippingCost,
      'tax_cost': taxCost,
      'car_name': carName,
      'carID': carId,
      'car_image': carImage,
      'car_price': carPrice,
      'user_email': userEmail,
      'userId': userId,
      'location': location,
      'showroomID': showroomId,
      'purpose': purpose ?? 'sale',
    };
  }

  factory CheckoutOrder.fromMap(Map<String, dynamic> map) {
    return CheckoutOrder(
      licenseNumber: map['license_number'] as String? ?? '',
      idNumber: map['id_number'] as String? ?? '',
      phoneNumber: map['phone_number'] as String? ?? '',
      rentalStart: map['rental_start'] is Timestamp
          ? (map['rental_start'] as Timestamp).toDate()
          : DateTime.now(),
      rentalEnd: map['rental_end'] is Timestamp
          ? (map['rental_end'] as Timestamp).toDate()
          : DateTime.now(),
      totalPayment: map['total_payment'] as int? ?? 0,
      currency: map['payment_currency'] as String? ?? 'aed',
      shippingCost: map['shipping_cost'] as int? ?? 0,
      taxCost: map['tax_cost'] as int? ?? 0,
      carName: map['car_name'] as String? ?? 'unknownCar',
      carId: (map['carID'] ?? map['carId']) as String? ?? '',
      carImage: map['car_image'] as String? ?? '',
      carPrice: map['car_price'] as int? ?? 0,
      userEmail: map['user_email'] as String?,
      userId: map['userId'] as String?,
      location: map['location'] as String?,
      showroomId: (map['showroomID'] ?? map['showroomId']) as String?,
      purpose: map['purpose'] as String?,
    );
  }
}