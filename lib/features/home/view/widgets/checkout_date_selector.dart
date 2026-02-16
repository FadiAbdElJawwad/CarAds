import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutDateSelector extends StatelessWidget {
  final String label;
  final DateTime? currentDate;
  final TimeOfDay? currentTime;
  final VoidCallback onSelectDate;
  final VoidCallback onSelectTime;

  const CheckoutDateSelector({
    super.key,
    required this.label,
    required this.currentDate,
    required this.currentTime,
    required this.onSelectDate,
    required this.onSelectTime,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.bodyRegular),
        context.addVerticalSpace(8),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onSelectDate,
                child: AbsorbPointer(
                  child: PrimaryTextField(
                    hint: currentDate != null
                        ? dateFormat.format(currentDate!)
                        : 'Select Date',
                  ),
                ),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: GestureDetector(
                onTap: onSelectTime,
                child: AbsorbPointer(
                  child: PrimaryTextField(
                    hint: currentTime?.format(context) ?? 'Select Time',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}