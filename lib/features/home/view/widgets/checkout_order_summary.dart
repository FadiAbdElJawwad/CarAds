import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/home/model/car_card_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../logic/service/url_formatter.dart';

class CheckoutOrderSummary extends StatelessWidget {
  final CarCardModel car;
  final int carPrice;
  final NumberFormat currencyFormat;
  final String currency;

  const CheckoutOrderSummary({
    super.key,
    required this.car,
    required this.carPrice,
    required this.currencyFormat,
    required this.currency,
  });

  Widget _buildCarImage() {
    final directUrl = UrlFormatter.getDirectGoogleDriveUrl(car.carImage);
    const size = 50.0;

    if (directUrl == null || directUrl.isEmpty) {
      return  Image.asset(ImagesManager.toyota, height: size, width: size, fit: BoxFit.contain);
    }

    return directUrl.startsWith('http')
        ? Image.network(
      directUrl,
      height: size,
      width: size,
      fit: BoxFit.contain,
      errorBuilder: (_, _, _) => Image.asset(ImagesManager.toyota, height: size, width: size),
    )
        : Image.asset(directUrl, height: size, width: size, fit: BoxFit.contain);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order', style: context.bodyBold),
        context.addVerticalSpace(8),
        Card(
          elevation: 2,
          child: ListTile(
            leading: _buildCarImage(),
            title: Text(car.carName ?? 'Unknown Name', style: context.bodyBold),
            trailing: Text('${currencyFormat.format(carPrice)} $currency', style: context.bodyBold),
          ).padVerticalSymmetric(16),
        ),
      ],
    );
  }
}