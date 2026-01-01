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
  final Widget screen;

  const NavButtonItem({
    super.key,
    required this.itemIndex,
    required this.currentIndex,
    required this.onPressed,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == itemIndex;
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Visibility(
              visible: isSelected,
              child: Container(
                height: 3,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ColorManager.mainColor,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                SvgPicture.asset(
                  isSelected ? selectedIcon : unselectedIcon,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}