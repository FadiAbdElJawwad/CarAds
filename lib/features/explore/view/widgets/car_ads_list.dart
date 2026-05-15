import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/explore/logic/helper/car_filter_helper.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:car_ads/core/models/car_card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/skeleton.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../logic/helper/cars_ads_error_message.dart';
import '../../../../core/services/car_firestore_service.dart';
import 'car_ads_card.dart';

class CarAdList extends StatelessWidget {
  final ScrollPhysics? physics;
  final int? listLength;
  final String? selectedCarType;
  final String? showroomID;
  final String? carID;
  final List<String>? carIDs;

  final CarFirestoreService _firestoreService;

  CarAdList({
    super.key,
    this.physics,
    this.listLength,
    this.selectedCarType,
    this.showroomID,
    this.carID,
    this.carIDs,
  }) : _firestoreService = CarFirestoreService();

  @override
  Widget build(BuildContext context) {
    final carAdsProvider = context.watch<CarAdsProvider>();
    final filter = carAdsProvider.filter;

    String? finalCarType = selectedCarType;
    if (filter.brand != 'All' && filter.brand != 'All Cars') {
      finalCarType = filter.brand;
    }

    return StreamBuilder<QuerySnapshot>(
      stream: _firestoreService.getCarsStream(
        carType: finalCarType,
        carIDs: carIDs,
        showroomID: showroomID,
        filter: filter,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CarAdListSkeleton(
            itemCount: listLength ?? 4,
            physics: physics,
          );
        }

        if (snapshot.hasError) {
          return const CarsAdsErrorMessage(
              message: "An error occurred while loading data");
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const CarsAdsErrorMessage(
              message: "No ads available matching your filters");
        }

        final filteredCars = CarFilterHelper.filterCars(
          docs: snapshot.data!.docs,
          filter: filter,
          carID: carID,
        );

        if (filteredCars.isEmpty) {
          return const CarsAdsErrorMessage(
              message: "No ads matching your filters");
        }

        final displayCount =
            listLength != null && listLength! < filteredCars.length
                ? listLength!
                : filteredCars.length;

        return CustomScrollView(
          shrinkWrap: true,
          physics: physics ?? const NeverScrollableScrollPhysics(),
          slivers: [
            if (filter.searchQuery.isNotEmpty)
              _ResultsHeader(
                  query: filter.searchQuery, count: filteredCars.length),
            _CarGrid(cars: filteredCars, count: displayCount),
          ],
        );
      },
    );
  }
}

class _ResultsHeader extends StatelessWidget {
  final String query;
  final int count;

  const _ResultsHeader({required this.query, required this.count});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Results for "$query"',
            style: context.titleBold18,
          ),
          Text(
            '$count founds',
            style: context.bodyRegular.copyWith(color: Colors.grey),
          ),
        ],
      ).padVerticalSymmetric(16),
    );
  }
}

class _CarGrid extends StatelessWidget {
  final List<CarCardModel> cars;
  final int count;

  const _CarGrid({required this.cars, required this.count});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, i) => CarAdsCard(car: cars[i]),
        childCount: count,
      ),
    );
  }
}

class CarAdListSkeleton extends StatelessWidget {
  final int itemCount;
  final ScrollPhysics? physics;

  const CarAdListSkeleton({
    super.key,
    this.itemCount = 4,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: physics ?? const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: Skeleton(width: double.infinity)),
              context.addVerticalSpace(16),
              const Skeleton(height: 18, width: 120),
              context.addVerticalSpace(4),
              const Skeleton(height: 18, width: 80),
              context.addVerticalSpace(4),
              const Skeleton(height: 18, width: 100),
              context.addVerticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Skeleton(height: 24, width: 60),
                  Skeleton(height: 24, width: 24, radius: 12),
                ],
              )
            ],
          ).padSymmetric(8).padVerticalSymmetric(16),
        );
      },
    );
  }
}
