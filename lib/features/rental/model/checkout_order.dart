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
  final String? userId;
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
    this.userId,
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
      'userId': userId,
      'location': location,
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
      currency: map['payment_currency'] as String? ?? 'AED',
      shippingCost: map['shipping_cost'] as int? ?? 0,
      taxCost: map['tax_cost'] as int? ?? 0,
      carName: map['car_name'] as String? ?? 'Unknown Car',
      carImage: map['car_image'] as String? ?? '',
      carPrice: map['car_price'] as int? ?? 0,
      userEmail: map['user_email'] as String?,
      userId: map['userId'] as String?,
      location: map['location'] as String?,
    );
  }
}
