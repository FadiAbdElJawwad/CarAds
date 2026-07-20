import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_button.dart';

  class LocationDetailsCard extends StatefulWidget {
  final String address;
  final VoidCallback onSetLocationPressed;

  const LocationDetailsCard({
    super.key,
    required this.address,
    required this.onSetLocationPressed,
  });

  @override
  State<LocationDetailsCard> createState() => _LocationDetailsCardState();
}

class _LocationDetailsCardState extends State<LocationDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.loc.yourLocationLabel,
            style: context.bodyRegular.copyWith(color: Colors.grey),
          ),
          context.addVerticalSpace(8),
          Row(
            children: [
              Image.asset(ImagesManager.locationIcon).padEnd(4),
              Expanded(
                child: Text(
                  widget.address.isEmpty ? context.loc.loadingLocation : widget.address,
                  style: context.bodyRegular.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          context.addVerticalSpace(18),
          PrimaryButton(
            text: context.loc.setLocationButton,
            onPressed: widget.onSetLocationPressed,
          ),
        ],
      ).padSymmetric(20).padVerticalSymmetric(24),
    );
  }
}