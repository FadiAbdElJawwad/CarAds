import 'package:flutter/material.dart';
import '../../../../common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../logic/provider/add_ads_provider.dart';

class AddAdsCarInfo extends StatelessWidget {
  final AddAdsProvider provider;

  const AddAdsCarInfo({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Car Information', style: context.inputRegular14),
        context.addVerticalSpace(16),
        Row(
          children: [
            Expanded(
              child: PrimaryTextField(
                controller: provider.brandController,
                hint: 'Car Brand',
                validator: (val) => val!.validateGeneric('Brand'),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: provider.modelController,
                hint: 'Car Model',
                validator: (val) => val!.validateGeneric('Model'),
              ),
            ),
          ],
        ),
        context.addVerticalSpace(8),
        Row(
          children: [
            Expanded(
              child: PrimaryTextField(
                controller: provider.yearController,
                hint: 'Year',
                keyboardType: TextInputType.number,
                validator: (val) => val!.validateGeneric('Year'),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: provider.conditionController,
                hint: 'Condition',
                validator: (val) => val!.validateGeneric('Condition'),
              ),
            ),
          ],
        ),
        context.addVerticalSpace(8),
        Row(
          children: [
            Expanded(
              child: PrimaryTextField(
                controller: provider.tankSizeController,
                hint: 'Tank Size',
                validator: (val) => val!.validateGeneric('Tank Size'),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: provider.gearBoxController,
                hint: 'Gear box',
                validator: (val) => val!.validateGeneric('Gear box'),
              ),
            ),
          ],
        ),
        context.addVerticalSpace(8),
        Row(
          children: [
            Expanded(
              child: PrimaryTextField(
                controller: provider.seatsController,
                hint: 'Seats',
                keyboardType: TextInputType.number,
                validator: (val) => val!.validateGeneric('Seats'),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: provider.doorsController,
                hint: 'Doors',
                keyboardType: TextInputType.number,
                validator: (val) => val!.validateGeneric('Doors'),
              ),
            ),
          ],
        ),
        context.addVerticalSpace(8),
        PrimaryTextField(
          controller: provider.mileageController,
          hint: 'Mileage',
          keyboardType: TextInputType.number,
          validator: (val) => val!.validateGeneric('Mileage'),
        ),
      ],
    );
  }
}
