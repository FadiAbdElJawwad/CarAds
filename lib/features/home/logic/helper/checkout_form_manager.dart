import 'package:car_ads/features/home/model/car_card_model.dart';
import 'package:car_ads/features/home/model/checkout_order.dart';
import 'package:car_ads/features/home/logic/service/checkout_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckoutFormManager {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final CheckoutService _checkoutService = CheckoutService();

  DateTime? rentalFromDate;
  TimeOfDay? rentalFromTime;
  DateTime? rentalUntilDate;
  TimeOfDay? rentalUntilTime;

  bool get isValid {
    final isFormValid = formKey.currentState?.validate() ?? false;
    final areDatesSelected = rentalFromDate != null && rentalUntilDate != null;
    return isFormValid && areDatesSelected;
  }

  Map<String, dynamic> createCheckoutData({
    required CarCardModel car,
    required int totalPayment,
    required int carPrice,
    required int shippingCost,
    required int taxCost,
    required String currency,
  }) {
    final startDateTime = _checkoutService.combineDateAndTime(rentalFromDate!, rentalFromTime);
    final endDateTime = _checkoutService.combineDateAndTime(rentalUntilDate!, rentalUntilTime);

    return CheckoutOrder(
      licenseNumber: licenseController.text.trim(),
      idNumber: idController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      rentalStart: startDateTime,
      rentalEnd: endDateTime,
      totalPayment: totalPayment,
      currency: currency,
      shippingCost: shippingCost,
      taxCost: taxCost,
      carName: car.carName ?? 'Unknown Car',
      carImage: car.carImage ?? '',
      carPrice: carPrice,
      userEmail: FirebaseAuth.instance.currentUser?.email,
    ).toMap();
  }

  void dispose() {
    licenseController.dispose();
    idController.dispose();
    phoneController.dispose();
  }
}
