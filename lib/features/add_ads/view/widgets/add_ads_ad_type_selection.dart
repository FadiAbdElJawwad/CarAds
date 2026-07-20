import 'package:flutter/material.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../logic/provider/add_ads_provider.dart';

class AddAdsAdTypeSelection extends StatelessWidget {
  final AddAdsProvider provider;

  const AddAdsAdTypeSelection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.selectAdTypePrompt,
          style: context.inputRegular14,
        ),
        context.addVerticalSpace(8),
        RadioGroup<String>(
          groupValue: provider.advertisingType,
          onChanged: (val) => provider.setAdvertisingType(val!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRadioOption(
                context,
                context.loc.commercial,
                context.loc.commercialAdLabel,
              ),
              _buildRadioOption(
                context,
                context.loc.featured,
                context.loc.featuredAdLabel,
              ),
            ],
          ),
        ),
        context.addVerticalSpace(8),
        Text(
          context.loc.featuredAdDescription,
          style: context.bodyRegular,
        ),
        context.addVerticalSpace(8),
      ],
    );
  }

  Widget _buildRadioOption(BuildContext context, String value, String label) {
    return Row(
      children: [
        Radio<String>(value: value, activeColor: Colors.black),
        Text(label, style: context.bodyBold),
      ],
    );
  }
}