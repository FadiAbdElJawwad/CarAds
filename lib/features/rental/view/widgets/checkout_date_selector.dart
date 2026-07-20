import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  final String label;
  final DateTime? currentDate;
  final TimeOfDay? currentTime;
  final VoidCallback onSelectDate;
  final VoidCallback onSelectTime;

  const DateSelector({
    super.key,
    required this.label,
    required this.currentDate,
    required this.currentTime,
    required this.onSelectDate,
    required this.onSelectTime,
  });

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late TextEditingController _dateController;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
    _updateControllers();
  }

  @override
  void didUpdateWidget(covariant DateSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentDate != oldWidget.currentDate ||
        widget.currentTime != oldWidget.currentTime) {
      _updateControllers();
    }
  }

  void _updateControllers() {
    final dateFormat = DateFormat('dd/MM/yyyy');
    _dateController.text = widget.currentDate != null
        ? dateFormat.format(widget.currentDate!)
        : '';
    _timeController.text = widget.currentTime != null
        ? widget.currentTime!.format(context)
        : '';
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: context.bodyRegular),
        context.addVerticalSpace(8),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: widget.onSelectDate,
                child: AbsorbPointer(
                  child: PrimaryTextField(
                    controller: _dateController,
                    hint: context.loc.selectDateHint,
                  ),
                ),
              ),
            ),
            context.addHorizontalSpace(16),
            Expanded(
              child: GestureDetector(
                onTap: widget.onSelectTime,
                child: AbsorbPointer(
                  child: PrimaryTextField(
                    controller: _timeController,
                    hint: context.loc.selectTimeHint,
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