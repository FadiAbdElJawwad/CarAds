import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/features/notifications/logic/provider/notification_provider.dart';
import 'package:car_ads/features/notifications/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, NotificationProvider>(
      builder: (context, authProvider, notificationProvider, child) {
        final userId = authProvider.state.user?.uid;

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: PrimaryAppBar(backIconVisible: true, text: 'Notification'),
          ),
          body: userId == null
              ? const Center(child: Text('User not logged in.'))
              : StreamBuilder<List<NotificationModel>>(
                  stream: notificationProvider.getNotificationsStream(userId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    final notifications = snapshot.data ?? [];

                    if (notifications.isEmpty) {
                      return const Center(child: Text('No notifications yet.'));
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: notifications.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return ListTile(
                          onTap: () {
                            if (!notification.isRead) {
                              notificationProvider.markAsRead(notification.id);
                            }

                            final bookingId =
                                notification.extraData?['bookingId'];
                            AppLogger.info(
                              'Notification tapped: bookingId = $bookingId',
                            );

                            if (bookingId != null) {
                              AppRouter.goTo(
                                screenName: ScreenName.confirmRentScreen,
                                arguments: {
                                  'orderId': bookingId,
                                  'isViewMode': true,
                                },
                              );
                            } else {
                              AppLogger.warning(
                                'No bookingId found in notification extraData',
                              );
                            }
                          },
                          title: Text(
                            notification.title,
                            style: context.titleBold18,
                          ),
                          subtitle: Text(
                            notification.body,
                            style: context.bodyRegular,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat('h:mm a').format(notification.time),
                                style: context.bodyRegular.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              if (!notification.isRead)
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ).padSymmetric(20);
                  },
                ),
        );
      },
    );
  }
}
