import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutPriceDetails extends StatelessWidget {
  final int carPrice;
  final int shippingCost;
  final int taxCost;
  final int totalPayment;
  final NumberFormat currencyFormat;
  final String currency;

  const CheckoutPriceDetails({
    super.key,
    required this.carPrice,
    required this.shippingCost,
    required this.taxCost,
    required this.totalPayment,
    required this.currencyFormat,
    required this.currency,
  });

  Widget _buildPriceRow(BuildContext context, String label, int amount, {bool isTotal = false}) {
    final color = isTotal ? null : Colors.grey;
    return ListTile(
      title: Text(label, style: context.bodyRegular),
      trailing: Text(
        '${currencyFormat.format(amount)} $currency',
        style: context.bodyBold.copyWith(color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Price Details', style: context.bodyBold),
        context.addVerticalSpace(8),
        Card(
          elevation: 2,
          child: Column(
            children: [
              _buildPriceRow(context, 'Amount', carPrice),
              _buildPriceRow(context, 'Shipping', shippingCost),
              _buildPriceRow(context, 'Tax', taxCost),
              const Divider(color: Colors.grey).padSymmetric(20),
              _buildPriceRow(context, 'Total payment', totalPayment, isTotal: true),
            ],
          ),
        ),
      ],
    );
  }
}
