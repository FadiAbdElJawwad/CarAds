import 'package:flutter/material.dart';
import '../../../../common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../logic/provider/add_ads_provider.dart';

class AddAdsDescription extends StatelessWidget {
  final AddAdsProvider provider;

  const AddAdsDescription({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: context.inputRegular14),
        context.addVerticalSpace(8),
        PrimaryTextField(
          controller: provider.descriptionController,
          hint: 'Provide a brief description of your car',
          maxLines: 8,
          validator: (val) => val!.validateGeneric('Description'),
        ),
      ],
    );
  }
}
