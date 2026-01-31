import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_app_bar.dart';
import '../../model/car_card_model.dart';
import '../widgets/car_ads_list.dart';
import '../../model/car_type_model.dart';
import '../widgets/car_type_list_view.dart';

class CarAdsScreen extends StatefulWidget {
  const CarAdsScreen({super.key});

  @override
  State<CarAdsScreen> createState() => _CarAdsScreenState();
}

class _CarAdsScreenState extends State<CarAdsScreen> {
  late List<CarTypeModel> carTypeData;
  late List<CarCardModel> carCardData;
  late List<CarCardModel> filteredCarCardData;
  late int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    carTypeData = carTypeList;
    carCardData = carCardList(context);
    filteredCarCardData = carCardData;
  }

  void _filterCarAds(String carType) {
    if (carType == 'All Cars') {
      filteredCarCardData = carCardData;
    } else {
      filteredCarCardData =
          carCardData.where((car) => car.carName == carType).toList();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + MediaQuery
            .of(context)
            .padding
            .top),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: carTypeData[_selectedIndex].carType,
        ),
      ),
      body: Column(
        children: [
          CarTypeListView(
            carTypeData: carTypeData,
            selectedIndex: _selectedIndex,
            onCarTypeSelected: (index) {
              setState(() {
                _selectedIndex = index;
                _filterCarAds(carTypeData[index].carType);
              });
            },
          ),
          context.addVerticalSpace(16),
          Expanded(
            child: CarAdList(
              carCardData: filteredCarCardData,
              physics: const BouncingScrollPhysics(),
            ).padSymmetric(20),
          )
        ],
      ),
    );
  }
}
