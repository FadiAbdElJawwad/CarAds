import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';

class CheckoutFormFields extends StatelessWidget {
  final TextEditingController licenseController;
  final TextEditingController idController;
  final TextEditingController phoneController;

  const CheckoutFormFields({
    super.key,
    required this.licenseController,
    required this.idController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryTextField(
          controller: licenseController,
          hint: 'Driving License No',
          keyboardType: TextInputType.number,
        ),
        context.addVerticalSpace(24),
        PrimaryTextField(
          controller: idController,
          hint: 'ID Number',
          keyboardType: TextInputType.number,
        ),
        context.addVerticalSpace(24),
        PrimaryTextField(
          controller: phoneController,
          hint: 'Phone Number',
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
