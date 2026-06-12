import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import 'car_ads_list.dart';

class ExploreSearchResults extends StatelessWidget {
  const ExploreSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return CarAdList(physics: const BouncingScrollPhysics()).padSymmetric(20);
  }
}
