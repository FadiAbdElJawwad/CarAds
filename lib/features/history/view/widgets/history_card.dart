import 'package:car_ads/common/car_image_extractor.dart';
import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/history_order.dart';

class HistoryCard extends StatelessWidget {
  final HistoryOrder order;

  const HistoryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.goTo(
          screenName: ScreenName.confirmRentScreen,
          arguments: {'orderId': order.id, 'isViewMode': true},
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(order.carName, style: context.titleBold18),
              trailing: SizedBox(
                width: 100,
                height: 100,
                child: CarImageExtractor.buildImage(
                  order.imageUrl,
                  height: 100,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'Order Date :',
                  style: context.bodyRegular.copyWith(color: Colors.grey),
                ),
                Text(
                  DateFormat(' d, MMM, yyyy').format(order.rentalStart),
                  style: context.bodyRegular,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Status :',
                  style: context.bodyRegular.copyWith(color: Colors.grey),
                ),
                Text(
                  ' ${order.status}',
                  style: context.bodyBold.copyWith(
                    color: order.status == 'Active'
                        ? ColorManager.successColor
                        : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ).pad(16),
      ),
    );
  }
}
