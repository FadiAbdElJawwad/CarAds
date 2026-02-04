import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_app_bar.dart';
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
  int _selectedIndex = 0;

  // void uploadDataToFirestore(BuildContext context) async {
  //   // final List<CarCardModel> myLocalList = carCardList(context);
  //
  //   for (var car in myLocalList) {
  //     try {
  //       await FirebaseFirestore.instance.collection('cars').add(car.toMap());
  //       print("تمت إضافة السيارة: ${car.carName}");
  //     } catch (e) {
  //       print("خطأ أثناء الإضافة: $e");
  //     }
  //   }
  //   print("تم الانتهاء من رفع جميع البيانات!");
  // }

  @override
  void initState() {
    super.initState();
    carTypeData = carTypeList;
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
          // FloatingActionButton(
          //   onPressed: () {
          //     uploadDataToFirestore(context);
          //   },
          //   child: const Icon(Icons.cloud_upload),
          // ),
          CarTypeListView(
            carTypeData: carTypeData,
            selectedIndex: _selectedIndex,
            onCarTypeSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          context.addVerticalSpace(16),
          Expanded(
            child: CarAdList(
              selectedCarType: carTypeData[_selectedIndex].carType,
              physics: const BouncingScrollPhysics(),
            ).padSymmetric(20),
          )
        ],
      ),
    );
  }
}
