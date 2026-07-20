import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../model/car_card_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/skeleton.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../logic/helper/cars_ads_error_message.dart';
import 'car_ads_card.dart';

class CarAdList extends StatelessWidget {
  final ScrollPhysics? physics;
  final int? listLength;
  final String? selectedCarType;
  final String? showroomID;
  final String? carID;
  final List<String>? carIDs;

  const CarAdList({
    super.key,
    this.physics,
    this.listLength,
    this.selectedCarType,
    this.showroomID,
    this.carID,
    this.carIDs,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CarAdsProvider>(
      builder: (context, carAdsProvider, child) {
        if (carAdsProvider.isLoading) {
          return CarAdListSkeleton(
            itemCount: listLength ?? 4,
            physics: physics,
          );
        }

        if (carAdsProvider.errorMessage != null) {
          return CarsAdsErrorMessage(message: carAdsProvider.errorMessage!);
        }

        List<CarCardModel> carsToDisplay;

        if (showroomID != null || carIDs != null || carID != null) {
          carsToDisplay = carAdsProvider.availableCars.where((car) {
            if (carID != null && car.carId == carID) {
              return false;
            }
            if (showroomID != null && car.showroomId != showroomID) {
              return false;
            }
            if (carIDs != null && !carIDs!.contains(car.carId)) {
              return false;
            }
            return true;
          }).toList();
        } else {
          carsToDisplay = carAdsProvider.filteredCars;
        }

        if (carsToDisplay.isEmpty) {
          return CarsAdsErrorMessage(
            message: context.loc.noAdsMatchingFilters,
          );
        }

        final displayCount =
        listLength != null && listLength! < carsToDisplay.length
            ? listLength!
            : carsToDisplay.length;

        final filter = carAdsProvider.filter;

        return CustomScrollView(
          shrinkWrap: true,
          physics: physics ?? const NeverScrollableScrollPhysics(),
          slivers: [
            if (filter.searchQuery.isNotEmpty && showroomID == null)
              _ResultsHeader(
                query: filter.searchQuery,
                count: carsToDisplay.length,
              ),
            _CarGrid(cars: carsToDisplay, count: displayCount),
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
            context.loc.resultsFor(query),
            style: context.titleBold18,
          ),
          Text(
            context.loc.itemsFound(count),
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

  const CarAdListSkeleton({super.key, this.itemCount = 4, this.physics});

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
              ),
            ],
          ).padSymmetric(8).padVerticalSymmetric(16),
        );
      },
    );
  }
}