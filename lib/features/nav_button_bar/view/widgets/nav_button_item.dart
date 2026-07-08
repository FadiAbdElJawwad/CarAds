import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/color_manager.dart';

class NavButtonItem extends StatelessWidget {
  final int itemIndex;
  final int currentIndex;
  final VoidCallback onPressed;
  final String selectedIcon;
  final String unselectedIcon;
  final String label;

  const NavButtonItem({
    super.key,
    required this.itemIndex,
    required this.currentIndex,
    required this.onPressed,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == itemIndex;
    return IntrinsicWidth(
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Visibility(
              visible: isSelected,
              child: Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(color: ColorManager.mainColor),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
                SvgPicture.asset(
                  isSelected ? selectedIcon : unselectedIcon,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: isSelected
                      ? context.inputBold12
                      : context.inputRegular12,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
