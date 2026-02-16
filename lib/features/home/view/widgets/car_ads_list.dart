import 'package:car_ads/features/home/model/car_card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../common/skeleton.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../logic/helper/cars_ads_error_message.dart';
import '../../logic/service/car_firestore_service.dart';
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
    return StreamBuilder<QuerySnapshot>(
      stream: _firestoreService.getCarsStream(
        carType: selectedCarType,
        carIDs: carIDs,
        showroomID: showroomID,
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
              message: "No ads available at the moment");
        }

        List<CarCardModel> fetchedCars = snapshot.data!.docs
            .map((doc) => CarCardModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();

        if (carID != null) {
          fetchedCars = fetchedCars.where((car) => car.carID != carID).toList();
        }

        if (fetchedCars.isEmpty) {
          return const CarsAdsErrorMessage(message: "No other ads available");
        }

        final displayCount = listLength != null && listLength! < fetchedCars.length
            ? listLength!
            : fetchedCars.length;

        return GridView.builder(
          shrinkWrap: true,
          physics: physics ?? const NeverScrollableScrollPhysics(),
          itemCount: displayCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, i) {
            final car = fetchedCars[i];
            return CarAdsCard(car: car);
          },
        );
      },
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
              const Expanded(
                child: Skeleton(width: double.infinity),
              ),
              context.addVerticalSpace(16),
              const Skeleton(height: 18, width: 120),
              context.addVerticalSpace(4),
              const Skeleton(height: 18, width: 80),
              context.addVerticalSpace(4),
              const Skeleton(height: 18, width: 100),
              context.addVerticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Skeleton(height: 24, width: 60),
                  const Skeleton(height: 24, width: 24, radius: 12),
                ],
              )
            ],
          ).padSymmetric(8).padVerticalSymmetric(16),
        );
      },
    );
  }
}
