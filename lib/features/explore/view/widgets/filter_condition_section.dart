import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../logic/provider/car_ads_provider.dart';

class FilterConditionSection extends StatelessWidget {
  const FilterConditionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CarAdsProvider>();
    final conditions = ['All', 'New', 'Used'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Car Condition', style: context.titleBold18),
        context.addVerticalSpace(12),
        SizedBox(
          height: context.screenHeight(40),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: conditions.length,
            separatorBuilder: (context, index) => context.addHorizontalSpace(8),
            itemBuilder: (context, index) {
              final condition = conditions[index];
              final isSelected = provider.tempFilter.condition == condition;
              return ChoiceChip(
                elevation: 0,
                backgroundColor: const Color(0xffF0F0F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffF0F0F0)),
                ),
                showCheckmark: false,
                label: Text(condition),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) provider.setCondition(condition);
                },
                selectedColor: Colors.black,
                labelStyle: context.inputRegular14.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
