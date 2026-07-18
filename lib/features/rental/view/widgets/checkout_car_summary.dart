import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/utils/url_formatter.dart';

class CheckoutCarSummary extends StatelessWidget {
  final CarCardModel car;

  const CheckoutCarSummary({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat('#,###');
    final carPrice = (int.tryParse(car.price ?? '0') ?? 0) * 1000;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Car Summary', style: context.bodyBold),
        context.addVerticalSpace(8),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildCarImage(),
            ),
            title: Text(
              '${car.carName} ${car.carModel}',
              style: context.bodyBold,
            ),
            subtitle: Text(
              '${car.year} | ${car.gearType}',
              style: context.bodyRegular.copyWith(fontSize: 12),
            ),
            trailing: Text(
              '${currencyFormat.format(carPrice)} ${AppConstants.currency}',
              style: context.bodyBold.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarImage() {
    final directUrl = UrlFormatter.getDirectGoogleDriveUrl(car.carImage);
    const size = 60.0;

    if (directUrl == null || directUrl.isEmpty) {
      return Image.asset(
        ImagesManager.toyota,
        height: size,
        width: size,
        fit: BoxFit.cover,
      );
    }

    return directUrl.startsWith('http')
        ? Image.network(
            directUrl,
            height: size,
            width: size,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) =>
                Image.asset(ImagesManager.toyota, height: size, width: size),
          )
        : Image.asset(
            directUrl,
            height: size,
            width: size,
            fit: BoxFit.cover,
          );
  }
}
