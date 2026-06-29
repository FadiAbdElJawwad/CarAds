import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class WelcomeHeaderWidget extends StatelessWidget {
  final String userName;
  const WelcomeHeaderWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome $userName',
              style: context.h2Bold22.copyWith(color: Colors.black),
            ),
            Text(
              'Manage your showroom today',
              style: context.bodyRegular.copyWith(color: Colors.grey),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Badge(
            label: Text('3'),
            child: Icon(Icons.notifications_none_rounded, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
