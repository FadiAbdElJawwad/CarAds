import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_button.dart';

class LocationDetailsCard extends StatelessWidget {
  final String address;
  final VoidCallback onSetLocationPressed;

  const LocationDetailsCard({
    super.key,
    required this.address,
    required this.onSetLocationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your Location',
            style: context.bodyRegular.copyWith(color: Colors.grey),
          ),
          context.addVerticalSpace(8),
          Row(children: [
            Image.asset(ImagesManager.locationIcon).padEnd(4),
            Expanded(
              child: Text(address, style: context.bodyRegular),
            )
          ]),
          context.addVerticalSpace(18),
          PrimaryButton(
            text: 'Set Location',
            onPressed: onSetLocationPressed,
          )
        ],
      ).padSymmetric(20).padVerticalSymmetric(24),
    );
  }
}
