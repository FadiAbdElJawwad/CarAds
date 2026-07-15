import 'package:flutter/material.dart';
import '../../../../common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/extension/text_style_extension.dart';

class AddAdsContactInfo extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const AddAdsContactInfo({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Information:', style: context.inputRegular14),
        context.addVerticalSpace(8),
        PrimaryTextField(
          controller: nameController,
          hint: 'Name',
          validator: (val) => val!.validateName(context),
        ),
        context.addVerticalSpace(16),
        PrimaryTextField(
          controller: phoneController,
          hint: 'Phone Number',
          keyboardType: TextInputType.phone,
          validator: (val) => val!.validateMobile(context),
        ),
      ],
    );
  }
}
