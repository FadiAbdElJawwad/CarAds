import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../model/car_type_model.dart';

class CarTypeListView extends StatefulWidget {
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
  State<CarTypeListView> createState() => _CarTypeListViewState();
}

class _CarTypeListViewState extends State<CarTypeListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: double.infinity,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.carTypeData.length,
          separatorBuilder: (context, index) => const SizedBox(width: 4),
          itemBuilder: (context, index) {
            final selected = widget.selectedIndex == index;
            return ChoiceChip(
              elevation: 0,
              backgroundColor: Color(0xffF0F0F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color:  Color(0xffF0F0F0),),

              ),
              showCheckmark: false,
              avatar: widget.carTypeData[index].carLogo != null
                  ? Image.asset(
                widget.carTypeData[index].carLogo!,
                fit: BoxFit.cover,
                color: selected ? Colors.white : Colors.black,
              )
                  : null,
              label: Text(widget.carTypeData[index].carType),
              selected: selected,
              onSelected: (bool isSelected) {
                if (isSelected) {
                  widget.onCarTypeSelected(index);
                }
              },
              selectedColor: Colors.black,
              labelStyle: context.inputRegular14.copyWith(
                color: selected ? Colors.white : Colors.black,
              ),
            );
          },
        )
    ).padStart(20);
  }
}
