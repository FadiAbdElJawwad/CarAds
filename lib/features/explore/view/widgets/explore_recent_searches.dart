import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:flutter/material.dart';

class ExploreRecentSearches extends StatelessWidget {
  final CarAdsProvider provider;
  final TextEditingController searchController;
  final FocusNode focusNode;

  const ExploreRecentSearches({
    super.key,
    required this.provider,
    required this.searchController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    if (provider.recentSearches.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.loc.recentSearchesTitle,
                style: context.titleBold18.copyWith(fontSize: 16),
              ),
              TextButton(
                onPressed: () => provider.clearRecentSearches(),
                child: Text(
                  context.loc.clearAll,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        ...provider.recentSearches.map(
              (query) => ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: Text(query, style: const TextStyle(color: Colors.grey)),
            trailing: IconButton(
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.grey,
                size: 20,
              ),
              onPressed: () => provider.removeRecentSearch(query),
            ),
            onTap: () {
              searchController.text = query;
              provider.setSearchQuery(query);
              focusNode.unfocus();
            },
          ),
        ),
      ],
    );
  }
}