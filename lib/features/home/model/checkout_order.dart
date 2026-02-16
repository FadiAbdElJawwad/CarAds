import 'package:cloud_firestore/cloud_firestore.dart';

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
  final String carImage;
  final int carPrice;
  final String? userEmail;
  final String? location;

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
    required this.carImage,
    required this.carPrice,
    this.userEmail,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'license_number': licenseNumber,
      'id_number': idNumber,
      'phone_number': phoneNumber,
      'rental_start': Timestamp.fromDate(rentalStart),
      'rental_end': Timestamp.fromDate(rentalEnd),
      'total_payment': totalPayment,
      'payment_currency': currency,
      'created_at': FieldValue.serverTimestamp(),
      'shipping_cost': shippingCost,
      'tax_cost': taxCost,
      'car_name': carName,
      'car_image': carImage,
      'car_price': carPrice,
      'user_email': userEmail,
      'location': location,
    };
  }

  factory CheckoutOrder.fromMap(Map<String, dynamic> map) {
    return CheckoutOrder(
      licenseNumber: map['license_number'] ?? '',
      idNumber: map['id_number'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      rentalStart: (map['rental_start'] as Timestamp).toDate(),
      rentalEnd: (map['rental_end'] as Timestamp).toDate(),
      totalPayment: map['total_payment'] ?? 0,
      currency: map['payment_currency'] ?? 'AED',
      shippingCost: map['shipping_cost'] ?? 0,
      taxCost: map['tax_cost'] ?? 0,
      carName: map['car_name'] ?? 'Unknown Car',
      carImage: map['car_image'] ?? '',
      carPrice: map['car_price'] ?? 0,
      userEmail: map['user_email'],
      location: map['location'],
    );
  }
}
