import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../core/constant/images_manager.dart';
import '../core/routes/app_router.dart';
import '../core/routes/screen_name.dart';

class PrimaryAppBar extends StatelessWidget {
  final String? text;
  final IconButton? icon;
  final  bool backIconVisible ;
  final  bool notificationVisible ;

  const PrimaryAppBar({
    super.key,
    this.text,
    this.icon,
    this.backIconVisible = false,
    this.notificationVisible = false
  });

  Future<void> _handleLogout(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.logout();
    AppRouter.goToAndRemove(screenName: ScreenName.login);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: backIconVisible,
                child: Card(
                  child: IconButton(
                      onPressed: () {
                        AppRouter.back();
                      },
                      icon: SvgPicture.asset(ImagesManager.arrowLeft)
                  ),
                ),
              ),
              context.addHorizontalSpace(8),
              Text(
                text!,
                style: context.h1Bold28,
              ),
            ],
          ),

          Visibility(
            visible: notificationVisible,
            child: Card(
              child: IconButton(
                onPressed: () => _handleLogout(context),
                icon: SvgPicture.asset(ImagesManager.notification),
              ),
            ),
          )
        ],
      ).padSymmetric(20),
    );
  }
}
