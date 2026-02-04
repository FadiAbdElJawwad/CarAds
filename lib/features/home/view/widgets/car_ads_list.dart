import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../logic/helper/cars_ads_error_message.dart';
import '../../logic/service/cars_firestore_service.dart';
import '../../model/car_card_model.dart';
import 'car_ads_card.dart';


class CarAdList extends StatelessWidget {
  final ScrollPhysics? physics;
  final int? listLength;
  final String? selectedCarType;
  final CarFirestoreService _firestoreService;

  CarAdList({
    super.key,
    this.physics,
    this.listLength,
    this.selectedCarType,
  }) : _firestoreService = CarFirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestoreService.getCarsStream(carType: selectedCarType),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _LoadingIndicator();
        }

        if (snapshot.hasError) {
          return const CarsAdsErrorMessage(
              message: "An error occurred while loading data");
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const CarsAdsErrorMessage(
              message: "No ads available at the moment");
        }

        final List<CarCardModel> fetchedCars = snapshot.data!.docs.map((doc) {
          return CarCardModel.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        return GridView.builder(
          shrinkWrap: true,
          physics: physics ?? const NeverScrollableScrollPhysics(),
          itemCount: listLength ?? fetchedCars.length,
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


class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}


