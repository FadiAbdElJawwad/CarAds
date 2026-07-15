import 'package:flutter/material.dart';
import '../../../../common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/extension/text_style_extension.dart';

class AddAdsCarInfo extends StatelessWidget {
  final TextEditingController brandController;
  final TextEditingController modelController;
  final TextEditingController yearController;
  final TextEditingController conditionController;
  final TextEditingController tankSizeController;
  final TextEditingController gearBoxController;
  final TextEditingController seatsController;
  final TextEditingController doorsController;
  final TextEditingController mileageController;

  const AddAdsCarInfo({
    super.key,
    required this.brandController,
    required this.modelController,
    required this.yearController,
    required this.conditionController,
    required this.tankSizeController,
    required this.gearBoxController,
    required this.seatsController,
    required this.doorsController,
    required this.mileageController,
  });

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

                controller: brandController,
                hint: 'Car Brand',
                validator: (val) => val!.validateGeneric('Brand'),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: modelController,
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
                controller: yearController,
                hint: 'Year',
                keyboardType: TextInputType.number,
                validator: (val) => val!.validateGeneric('Year'),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: conditionController,
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
                controller: tankSizeController,
                hint: 'Tank Size',
                validator: (val) => val!.validateGeneric('Tank Size'),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: gearBoxController,
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
                controller: seatsController,
                hint: 'Seats',
                keyboardType: TextInputType.number,
                validator: (val) => val!.validateGeneric('Seats'),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: doorsController,
                hint: 'Doors',
                keyboardType: TextInputType.number,
                validator: (val) => val!.validateGeneric('Doors'),
              ),
            ),
          ],
        ),
        context.addVerticalSpace(8),
        PrimaryTextField(
          controller: mileageController,
          hint: 'Mileage',
          keyboardType: TextInputType.number,
          validator: (val) => val!.validateGeneric('Mileage'),
        ),
      ],
    );
  }
}
