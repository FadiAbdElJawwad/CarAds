import 'package:flutter/material.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'checkout_date_selector.dart';

class CheckoutRentalSection extends StatelessWidget {
  final DateTime? userStartDate;
  final TimeOfDay? userStartTime;
  final DateTime? userEndDate;
  final TimeOfDay? userEndTime;
  final VoidCallback onPickStartDate;
  final VoidCallback onPickStartTime;
  final VoidCallback onPickEndDate;
  final VoidCallback onPickEndTime;

  const CheckoutRentalSection({
    super.key,
    required this.userStartDate,
    required this.userStartTime,
    required this.userEndDate,
    required this.userEndTime,
    required this.onPickStartDate,
    required this.onPickStartTime,
    required this.onPickEndDate,
    required this.onPickEndTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.addVerticalSpace(24),
        DateSelector(
          label: 'Rental From',
          currentDate: userStartDate,
          currentTime: userStartTime,
          onSelectDate: onPickStartDate,
          onSelectTime: onPickStartTime,
        ),
        context.addVerticalSpace(16),
        DateSelector(
          label: 'Rental Until',
          currentDate: userEndDate,
          currentTime: userEndTime,
          onSelectDate: onPickEndDate,
          onSelectTime: onPickEndTime,
        ),
      ],
    );
  }
}
