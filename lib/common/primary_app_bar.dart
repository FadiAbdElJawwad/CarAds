import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/features/notifications/logic/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../core/constant/images_manager.dart';
import '../core/routes/app_router.dart';
import '../core/models/notification_model.dart';

class PrimaryAppBar extends StatelessWidget {
  final bool backIconVisible;
  final bool notificationVisible;
  final String text;
  final Widget? trailing;

  const PrimaryAppBar({
    super.key,
    this.backIconVisible = false,
    this.notificationVisible = false,
    required this.text,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: context.h1Bold28,
      ),
      leading: backIconVisible
          ? Card(
            child: IconButton(
                onPressed: () {
                  AppRouter.back();
                },
                icon: SvgPicture.asset(ImagesManager.arrowLeft)),
          )
          : null,
      actions: [
        if (notificationVisible)
          Consumer2<AuthProvider, NotificationProvider>(
            builder: (context, authProvider, notificationProvider, _) {
              final userId = authProvider.state.user?.uid;
              if (userId == null) {
                return _buildNotificationIcon(false);
              }
              return StreamBuilder<List<NotificationModel>>(
                stream: notificationProvider.getNotificationsStream(userId),
                builder: (context, snapshot) {
                  final hasUnread = snapshot.data?.any((n) => !n.isRead) ?? false;
                  return _buildNotificationIcon(hasUnread);
                },
              );
            },
          ),
        ?trailing,
      ],
    ).padSymmetric(20);
  }

  Widget _buildNotificationIcon(bool hasUnread) {
    return Card(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            onPressed: () {
              AppRouter.goTo(screenName: ScreenName.notificationScreen);
            },
            icon: SvgPicture.asset(ImagesManager.notification),
          ),
          if (hasUnread)
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 8,
                  minHeight: 8,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
