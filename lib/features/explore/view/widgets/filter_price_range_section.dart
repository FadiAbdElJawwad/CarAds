import 'package:car_ads/core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../logic/provider/car_ads_provider.dart';

class FilterPriceRangeSection extends StatelessWidget {
  const FilterPriceRangeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CarAdsProvider>();
    final priceRange = provider.tempFilter.priceRange;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Price Range', style: context.titleBold18),
            Text(
              '${priceRange.start.round() ~/ 1000}K AED - ${priceRange.end.round() ~/ 1000}K AED',
              style: context.bodyBold,
            ),
          ],
        ),
        RangeSlider(
          values: priceRange,
          min: AppConstants.minPrice,
          max: AppConstants.maxPrice,
          divisions: 100,
          activeColor: Colors.black,
          inactiveColor: Colors.grey.shade300,
          onChanged: (values) {
            provider.setPriceRange(values);
          },
        ),
      ],
    );
  }
}
