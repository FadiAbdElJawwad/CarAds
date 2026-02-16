import 'package:flutter/material.dart';
import '../../model/car_card_model.dart';
import '../../view/widgets/car_ads_list.dart';

class SuggestedAds extends StatelessWidget {
  final CarCardModel car;

  const SuggestedAds({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    if (car.showroomID != null && car.showroomID!.isNotEmpty) {
      return CarAdList(
        showroomID: car.showroomID,
        carID: car.carID,
        listLength: 4,
      );
    }

    return const Text("No suggested ads available for this car.");
  }
}