import 'package:flutter/material.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import '../../../rental/view/widgets/checkout_date_selector.dart';

class AddAdsRentalSection extends StatelessWidget {
  final String adPurpose;
  final String rentalDurationType;
  final DateTime? startDate;
  final TimeOfDay? startTime;
  final DateTime? endDate;
  final TimeOfDay? endTime;
  final VoidCallback onPickStartDate;
  final VoidCallback onPickStartTime;
  final VoidCallback onPickEndDate;
  final VoidCallback onPickEndTime;
  final ValueChanged<String?> onDurationChanged;

  const AddAdsRentalSection({
    super.key,
    required this.adPurpose,
    required this.rentalDurationType,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.onPickStartDate,
    required this.onPickStartTime,
    required this.onPickEndDate,
    required this.onPickEndTime,
    required this.onDurationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: adPurpose == 'rent'
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.addVerticalSpace(24),
          Text(context.loc.rentalDuration, style: context.inputRegular14),
          context.addVerticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: RadioListTile<String>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  activeColor: Colors.black,
                  title: Text(context.loc.days, style: context.inputRegular14),
                  value: 'days',
                  groupValue: rentalDurationType,
                  onChanged: onDurationChanged,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  activeColor: Colors.black,
                  title: Text(context.loc.weeks, style: context.inputRegular14),
                  value: 'weeks',
                  groupValue: rentalDurationType,
                  onChanged: onDurationChanged,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  activeColor: Colors.black,
                  title: Text(context.loc.months, style: context.inputRegular14),
                  value: 'months',
                  groupValue: rentalDurationType,
                  onChanged: onDurationChanged,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
            ],
          ),
          context.addVerticalSpace(16),
          DateSelector(
            label: context.loc.availableFrom,
            currentDate: startDate,
            currentTime: startTime,
            onSelectDate: onPickStartDate,
            onSelectTime: onPickStartTime,
          ),
          context.addVerticalSpace(16),
          DateSelector(
            label: context.loc.availableUntil,
            currentDate: endDate,
            currentTime: endTime,
            onSelectDate: onPickEndDate,
            onSelectTime: onPickEndTime,
          ),
        ],
      )
          : const SizedBox.shrink(),
    );
  }
}