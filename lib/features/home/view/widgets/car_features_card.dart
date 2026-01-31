import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../model/car_card_model.dart';
import 'car_features.dart';

class CarFeaturesCard extends StatelessWidget {
  final CarCardModel car;
  const CarFeaturesCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarFeatures(
              assetName: ImagesManager.fuel,
              label: car.fuel!,
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            CarFeatures(
              assetName: ImagesManager.seats,
              label: car.seats!,
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
             CarFeatures(
              assetName: ImagesManager.doors,
              label: car.doors!,
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            CarFeatures(
              assetName: ImagesManager.gear,
              label: car.gearType!,
            ),
          ],
        ).padVerticalSymmetric(11).padSymmetric(16),
      ),
    );
  }
}
