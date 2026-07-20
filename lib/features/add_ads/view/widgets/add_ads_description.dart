import 'package:flutter/material.dart';
import '../../../../common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/extension/text_style_extension.dart';

class AddAdsDescription extends StatelessWidget {
  final TextEditingController descriptionController;

  const AddAdsDescription({
    super.key,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.description, style: context.inputRegular14),
        context.addVerticalSpace(8),
        PrimaryTextField(
          controller: descriptionController,
          hint: context.loc.descriptionHint,
          maxLines: 8,
          validator: (val) => val!.validateGeneric(context, context.loc.description),
        ),
      ],
    );
  }
}