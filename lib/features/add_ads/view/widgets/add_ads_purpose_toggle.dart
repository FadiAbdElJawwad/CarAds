import 'package:flutter/material.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';

class AddAdsPurposeToggle extends StatelessWidget {
  final String adPurpose;
  final ValueChanged<String?> onChanged;

  const AddAdsPurposeToggle({
    super.key,
    required this.adPurpose,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.selectAdPurposePrompt,
          style: context.inputRegular14,
        ),
        context.addVerticalSpace(8),
        RadioListTile<String>(
          activeColor: Colors.black,
          title: Text(context.loc.carForSale, style: context.bodyRegular),
          value: 'sale',
          groupValue: adPurpose,
          onChanged: onChanged,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        RadioListTile<String>(
          activeColor: Colors.black,
          title: Text(context.loc.carForRent, style: context.bodyRegular),
          value: 'rent',
          groupValue: adPurpose,
          onChanged: onChanged,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
      ],
    );
  }
}