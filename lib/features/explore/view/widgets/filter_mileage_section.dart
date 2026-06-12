import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../logic/provider/car_ads_provider.dart';

class FilterMileageSection extends StatefulWidget {
  const FilterMileageSection({super.key});

  @override
  State<FilterMileageSection> createState() => _FilterMileageSectionState();
}

class _FilterMileageSectionState extends State<FilterMileageSection> {
  late TextEditingController _startController;
  late TextEditingController _endController;

  @override
  void initState() {
    super.initState();
    final filter = context.read<CarAdsProvider>().tempFilter;
    _startController = TextEditingController(
      text: filter.startMileage?.toString(),
    );
    _endController = TextEditingController(text: filter.endMileage?.toString());
  }

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CarAdsProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mileage', style: context.titleBold18),
        context.addVerticalSpace(8),
        Text(
          'Select Mileage Range:',
          style: context.bodyRegular.copyWith(color: Colors.grey),
        ),
        context.addVerticalSpace(12),
        Row(
          children: [
            Expanded(
              child: PrimaryTextField(
                controller: _startController,
                hint: 'Start Mileage',
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  provider.setMileage(
                    int.tryParse(val),
                    int.tryParse(_endController.text),
                  );
                  return;
                },
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: PrimaryTextField(
                controller: _endController,
                hint: 'End Mileage',
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  provider.setMileage(
                    int.tryParse(_startController.text),
                    int.tryParse(val),
                  );
                  return;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
