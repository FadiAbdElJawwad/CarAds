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
        Text(context.loc.carInformation, style: context.inputRegular14),
        context.addVerticalSpace(16),
        Row(
          children: [
            Expanded(
              child: PrimaryTextField(
                controller: brandController,
                hint: context.loc.carBrandHint,
                validator: (val) =>
                    val!.validateGeneric(context, context.loc.brandLabel),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: modelController,
                hint: context.loc.carModelHint,
                validator: (val) =>
                    val!.validateGeneric(context, context.loc.modelLabel),
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
                hint: context.loc.year,
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val!.validateGeneric(context, context.loc.year),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: conditionController,
                hint: context.loc.condition,
                validator: (val) =>
                    val!.validateGeneric(context, context.loc.condition),
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
                hint: context.loc.tankSize,
                validator: (val) =>
                    val!.validateGeneric(context, context.loc.tankSize),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: gearBoxController,
                hint: context.loc.gearBox,
                validator: (val) =>
                    val!.validateGeneric(context, context.loc.gearBox),
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
                hint: context.loc.seats,
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val!.validateGeneric(context, context.loc.seats),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: doorsController,
                hint: context.loc.doors,
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val!.validateGeneric(context, context.loc.doors),
              ),
            ),
          ],
        ),
        context.addVerticalSpace(8),
        PrimaryTextField(
          controller: mileageController,
          hint: context.loc.mileage,
          keyboardType: TextInputType.number,
          validator: (val) => val!.validateGeneric(context, context.loc.mileage),
        ),
      ],
    );
  }
}