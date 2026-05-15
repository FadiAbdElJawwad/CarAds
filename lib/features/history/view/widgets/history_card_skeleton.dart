import 'package:car_ads/common/skeleton.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';

class HistoryCardSkeleton extends StatelessWidget {
  const HistoryCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Skeleton(width: 120, height: 18),
            subtitle: Skeleton(width: 80, height: 14),
            trailing: Skeleton(width: 100, height: 100),
          ),
          context.addVerticalSpace(8),
          const Row(
            children: [
              Skeleton(width: 80, height: 14),
              SizedBox(width: 8),
              Skeleton(width: 120, height: 14),
            ],
          ),
          context.addVerticalSpace(8),
          const Row(
            children: [
              Skeleton(width: 50, height: 14),
              SizedBox(width: 8),
              Skeleton(width: 60, height: 14),
            ],
          ),
        ],
      ).pad(16),
    );
  }
}
