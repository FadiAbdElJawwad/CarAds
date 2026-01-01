import 'package:flutter/material.dart';

class SliderIndicator extends StatelessWidget {
  final bool selected;
  final int currentPage;

  const SliderIndicator(
      {super.key, required this.selected, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9,
      width: selected ? 35 : 9,
      decoration: BoxDecoration(
          color: selected
              ? Colors.black
              : Colors.grey,
          borderRadius: BorderRadius.circular(25)
      ),
    );
  }
}
