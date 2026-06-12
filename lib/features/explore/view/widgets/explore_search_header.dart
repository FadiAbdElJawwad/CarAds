import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:flutter/material.dart';
import 'filter_bottom_sheet.dart';

class ExploreSearchHeader extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final CarAdsProvider provider;

  const ExploreSearchHeader({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.provider,
  });

  void _showFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: PrimaryTextField(
              controller: controller,
              focusNode: focusNode,
              icon: const Icon(Icons.search),
              hint: 'Start your search ...',
              onChanged: (value) => provider.setSearchQuery(value),
              onSubmitted: (value) {
                provider.addRecentSearch(value);
                focusNode.unfocus();
              },
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.grey),
                      onPressed: () {
                        controller.clear();
                        provider.setSearchQuery('');
                      },
                    )
                  : null,
            ),
          ),
          context.addHorizontalSpace(8),
          Card(
            child: IconButton(
              icon: const Icon(Icons.tune),
              onPressed: () => _showFilter(context),
            ),
          ),
        ],
      ),
    );
  }
}
