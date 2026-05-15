import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/car_type_model.dart';
import '../widgets/explore_default_view.dart';
import '../widgets/explore_search_header.dart';
import '../widgets/explore_search_results.dart';

class CarAdsScreen extends StatefulWidget {
  const CarAdsScreen({super.key});

  @override
  State<CarAdsScreen> createState() => _CarAdsScreenState();
}

class _CarAdsScreenState extends State<CarAdsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carAdsProvider = context.watch<CarAdsProvider>();
    final isSearching = carAdsProvider.filter.searchQuery.isNotEmpty;
    final currentBrand = carAdsProvider.filter.brand;
    final selectedIndex = carTypeList.indexWhere((type) =>
    type.carType == currentBrand);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            context.addVerticalSpace(MediaQuery
                .of(context)
                .padding
                .top + 20),
            context.addVerticalSpace(16),
            ExploreSearchHeader(
              controller: _searchController,
              focusNode: _focusNode,
              provider: carAdsProvider,
            ),
            Expanded(
              child: isSearching
                  ? const ExploreSearchResults()
                  : ExploreDefaultView(
                provider: carAdsProvider,
                searchController: _searchController,
                focusNode: _focusNode,
                currentBrand: currentBrand,
                selectedIndex: selectedIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
