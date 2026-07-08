import 'package:car_ads/common/skeleton.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';

class ShowroomRequestSkeleton extends StatelessWidget {
  const ShowroomRequestSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Skeleton(width: 80, height: 80, radius: 12),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skeleton(width: 100, height: 16),
                    Skeleton(width: 60, height: 16),
                  ],
                ),
                context.addVerticalSpace(8),
                const Skeleton(width: 140, height: 14),
                context.addVerticalSpace(8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skeleton(width: 80, height: 14),
                    Skeleton(width: 50, height: 20, radius: 8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
