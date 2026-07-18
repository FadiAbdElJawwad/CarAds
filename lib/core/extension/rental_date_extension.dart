import 'package:flutter/material.dart';
import '../../features/explore/model/car_card_model.dart';

extension CarRentalDates on CarCardModel {
  DateTime get showroomStartDate {
    final parsed = DateTime.tryParse(startDate ?? '') ?? DateTime.now();
    // Do not allow dates in the past
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return parsed.isBefore(today) ? today : parsed;
  }

  DateTime get showroomEndDate {
    return DateTime.tryParse(endDate ?? '') ??
        DateTime.now().add(const Duration(days: 365));
  }

  TimeOfDay parseTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) {
      return const TimeOfDay(hour: 0, minute: 0);
    }
    final parts = timeStr.split(':');
    return TimeOfDay(
      hour: int.tryParse(parts[0]) ?? 0,
      minute: int.tryParse(parts[1]) ?? 0,
    );
  }

  int timeToMinutes(TimeOfDay t) => t.hour * 60 + t.minute;
}
