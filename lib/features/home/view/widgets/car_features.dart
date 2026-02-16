import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/extension/text_style_extension.dart';

class CarFeatures extends StatelessWidget {
  const CarFeatures({
    super.key,
    required this.assetName,
    required this.label,
  });

  final String assetName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(assetName),
        const SizedBox(height: 8),
        Text(
          label,
          style: context.inputBold14.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
