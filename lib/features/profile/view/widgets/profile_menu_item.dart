import 'package:flutter/material.dart';
import '../../../../core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final bool isLogout;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = Icons.arrow_right,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isLogout ? ColorManager.warningColor : Colors.black;

    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Text(title, style: context.bodyRegular.copyWith(color: color)),
      trailing: Card(
        color: ColorManager.backgroundColor,
        child: Icon(icon, color: color).pad(7),
      ),
    );
  }
}
