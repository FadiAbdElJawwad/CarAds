import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.titleBold18.copyWith(color: Colors.black)),
        TextButton(
          onPressed: onSeeAll,
          child: Text(
            'See All',
            style: context.bodyRegular.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
