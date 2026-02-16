import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../../common/primary_button.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../../common/car_image_extractor.dart';
import '../../logic/service/checkout_service.dart';
import '../../model/checkout_order.dart';
import '../widgets/checkout_priced_details.dart';

class ConfirmRentScreen extends StatefulWidget {
  final String orderId;

  const ConfirmRentScreen({super.key, required this.orderId});

  @override
  State<ConfirmRentScreen> createState() => _ConfirmRentScreenState();
}

class _ConfirmRentScreenState extends State<ConfirmRentScreen> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> _orderDetailsFuture;
  final CheckoutService _checkoutService = CheckoutService();
  final _currencyFormat = NumberFormat('#,###');

  @override
  void initState() {
    super.initState();
    _orderDetailsFuture = _checkoutService.getCheckoutOrder(widget.orderId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery
                .of(context)
                .padding
                .top),
        child: const PrimaryAppBar(backIconVisible: true, text: 'Confirm Rent'),
      ),
      bottomNavigationBar: Card(
        child: PrimaryButton(
          text: 'Confirm Rent',
          onPressed: () {
            AppRouter.goToAndRemove(
                screenName: ScreenName.rentalCompletedScreen);
          },
        ).padSymmetric(20).padVerticalSymmetric(17),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: _orderDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Order details not found.'));
          }

          final orderData = snapshot.data!.data();
          if (orderData == null) {
            return const Center(child: Text('Order data is empty.'));
          }

          final checkoutOrder = CheckoutOrder.fromMap(orderData);

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text('Shipping Address', style: context.bodyBold),
              context.addVerticalSpace(4),
              Card(
                child: ListTile(
                  leading: Image.asset(ImagesManager.location),
                  title: Text('Your Location', style: context.bodyBold),
                  subtitle: Text(
                      checkoutOrder.location ?? 'No address provided',
                      style: context.bodyRegular),
                ),
              ),
              context.addVerticalSpace(24),
              Text('Order', style: context.bodyBold),
              context.addVerticalSpace(8),
              Card(
                child: ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: CarImageExtractor.buildImage(
                        checkoutOrder.carImage, height: 50),
                  ),
                  title: Text(checkoutOrder.carName, style: context.bodyBold),
                  trailing: Text(
                    '${_currencyFormat.format(
                        checkoutOrder.carPrice)} ${checkoutOrder.currency}',
                    style: context.bodyBold,
                  ),
                ).padVerticalSymmetric(16),
              ),
              context.addVerticalSpace(24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: ColorManager.successColor),
                ),
                child: ListTile(
                  title: Text('Driving License No',
                      style: context.inputRegular14.copyWith(fontSize: 12)),
                  subtitle: Text(checkoutOrder.licenseNumber,
                      style: context.inputRegular14),
                ),
              ),
              context.addVerticalSpace(24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: ColorManager.successColor),
                ),
                child: ListTile(
                  title: Text('ID Number',
                      style: context.inputRegular14.copyWith(fontSize: 12)),
                  subtitle: Text(
                      checkoutOrder.idNumber, style: context.inputRegular14),
                ),
              ),
              context.addVerticalSpace(24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: ColorManager.successColor),
                ),
                child: ListTile(
                  title: Text('Phone Number',
                      style: context.inputRegular14.copyWith(fontSize: 12)),
                  subtitle: Text(
                      checkoutOrder.phoneNumber, style: context.inputRegular14),
                ),
              ),
              context.addVerticalSpace(24),
              CheckoutPriceDetails(
                carPrice: checkoutOrder.carPrice,
                shippingCost: checkoutOrder.shippingCost,
                taxCost: checkoutOrder.taxCost,
                totalPayment: checkoutOrder.totalPayment,
                currencyFormat: _currencyFormat,
                currency: checkoutOrder.currency,
              ),
            ],
          );
        },
      ),
    );
  }
}
