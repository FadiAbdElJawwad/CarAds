import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:car_ads/features/explore/model/car_type_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/color_manager.dart';
import 'car_type_list_view.dart';
import 'filter_action_buttons.dart';
import 'filter_condition_section.dart';
import 'filter_mileage_section.dart';
import 'filter_price_range_section.dart';
import 'filter_year_section.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarAdsProvider>().initTempFilter();
    });
  }

  @override
  Widget build(BuildContext context) {
    final carAdsProvider = context.watch<CarAdsProvider>();
    final currentBrand = carAdsProvider.tempFilter.brand;
    final selectedBrandIndex = carTypeList.indexWhere(
      (type) => type.carType == currentBrand,
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: context.spaceAroundAll(24.0),
        decoration: const BoxDecoration(
          color: ColorManager.backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: context.screenWidth(40),
                  height: context.screenHeight(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              context.addVerticalSpace(16),
              Center(child: Text('Filter', style: context.h2Bold22)),
              const Divider(),
              context.addVerticalSpace(16),
              Text('Car Brands', style: context.titleBold18),
              context.addVerticalSpace(12),
              CarTypeListView(
                carTypeData: carTypeList,
                selectedIndex: selectedBrandIndex == -1
                    ? 0
                    : selectedBrandIndex,
                onCarTypeSelected: (index) {
                  carAdsProvider.setBrand(carTypeList[index].carType);
                },
              ),
              context.addVerticalSpace(24),
              const FilterConditionSection(),
              context.addVerticalSpace(24),
              const FilterPriceRangeSection(),
              context.addVerticalSpace(24),
              const FilterMileageSection(),
              context.addVerticalSpace(24),
              const FilterYearSection(),
              context.addVerticalSpace(32),
              const FilterActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
