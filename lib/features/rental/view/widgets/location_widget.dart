import 'package:car_ads/common/skeleton.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/rental/logic/provider/checkout_provider.dart';
import 'package:car_ads/features/home/model/map_selection_result.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/app_sizes.dart';

class LocationWidget extends StatefulWidget {
  final CheckoutProvider model;

  const LocationWidget({super.key, required this.model});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.model.fetchInitialLocation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.model.isLocationLoading) {
      return const Skeleton(height: 150, width: double.infinity);
    }

    return InkWell(
      onTap: () async {
        final result =
            await Navigator.of(context).pushNamed(ScreenName.mapScreen);
        if (result is MapSelectionResult) {
          widget.model.handleMapResult(result);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          ImagesManager.map,
          height: context.screenHeight(150),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
