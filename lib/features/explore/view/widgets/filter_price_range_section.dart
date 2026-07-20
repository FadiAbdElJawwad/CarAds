import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
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

    final String startPrice = (priceRange.start / 1000).round().toString();
    final String endPrice = (priceRange.end / 1000).round().toString();
    final String suffix = context.loc.thousandSuffix;
    final String currency = context.loc.aed;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.loc.priceRange, style: context.titleBold18),
            Text(
              '$startPrice$suffix $currency - $endPrice$suffix $currency',
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