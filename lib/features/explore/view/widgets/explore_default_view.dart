import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:flutter/material.dart';
import '../../model/car_type_model.dart';
import 'car_ads_list.dart';
import 'car_type_list_view.dart';
import 'explore_recent_searches.dart';

class ExploreDefaultView extends StatelessWidget {
  final CarAdsProvider provider;
  final TextEditingController searchController;
  final FocusNode focusNode;
  final String currentBrand;
  final int selectedIndex;

  const ExploreDefaultView({
    super.key,
    required this.provider,
    required this.searchController,
    required this.focusNode,
    required this.currentBrand,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bool showHistory =
        focusNode.hasFocus && provider.recentSearches.isNotEmpty;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (showHistory)
          ExploreRecentSearches(
            provider: provider,
            searchController: searchController,
            focusNode: focusNode,
          )
        else ...[
          context.addVerticalSpace(16),
          CarTypeListView(
            carTypeData: carTypeList,
            selectedIndex: selectedIndex == -1 ? 0 : selectedIndex,
            onCarTypeSelected: (index) {
              provider.setBrandAndApply(carTypeList[index].carType);
            },
          ).padStart(20),
          context.addVerticalSpace(16),
          CarAdList(
            selectedCarType: currentBrand,
            physics: const NeverScrollableScrollPhysics(),
          ).padSymmetric(20),
        ],
      ],
    );
  }
}
