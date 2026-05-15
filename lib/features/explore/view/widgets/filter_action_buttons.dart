import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_button.dart';
import '../../logic/provider/car_ads_provider.dart';

class FilterActionButtons extends StatelessWidget {
  const FilterActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CarAdsProvider>();

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: PrimaryButton(
            text: 'Apply',
            color: Colors.black,
            onPressed: () {
              provider.applyFilter();
              Navigator.pop(context);
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: PrimaryButton(
            text: 'Reset',
            color: Colors.grey.shade200,
            textColor: Colors.black,
            onPressed: () {
              provider.resetFilter();
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
