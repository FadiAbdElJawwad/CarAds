import 'package:flutter/material.dart';
import '../../../../common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../logic/provider/add_ads_provider.dart';

class AddAdsContactInfo extends StatelessWidget {
  final AddAdsProvider provider;

  const AddAdsContactInfo({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Information:', style: context.inputRegular14),
        context.addVerticalSpace(8),
        PrimaryTextField(
          controller: provider.nameController,
          hint: 'Name',
          validator: (val) => val!.validateName(context),
        ),
        context.addVerticalSpace(16),
        PrimaryTextField(
          controller: provider.phoneController,
          hint: 'Phone Number',
          keyboardType: TextInputType.phone,
          validator: (val) => val!.validateMobile(context),
        ),
      ],
    );
  }
}
