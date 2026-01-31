import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../model/car_type_model.dart';

class CarTypeListView extends StatelessWidget {
  final List<CarTypeModel> carTypeData;
  final int selectedIndex;
  final ValueChanged<int> onCarTypeSelected;

  const CarTypeListView({
    super.key,
    required this.carTypeData,
    required this.selectedIndex,
    required this.onCarTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: double.infinity,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: carTypeData.length,
          separatorBuilder: (context, index) => const SizedBox(width: 4),
          itemBuilder: (context, index) {
            final selected = selectedIndex == index;
            return InkWell(
              onTap: () => onCarTypeSelected(index),
              child: Card(
                color: selected ? Colors.black : null,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (carTypeData[index].carLogo != null)
                      Image.asset(
                        carTypeData[index].carLogo!,
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                        color: selected ? Colors.white : null,
                      )
                    else
                      const SizedBox(),

                    context.addHorizontalSpace(4),
                    Text(
                      carTypeData[index].carType,
                      style: context.inputRegular14.copyWith(
                        color: selected ? Colors.white : null,
                      ),
                    ),
                  ],
                ).padSymmetric(16).padVerticalSymmetric(8),
              ),
            );
          },
        )
    ).padStart(20);
  }
}
