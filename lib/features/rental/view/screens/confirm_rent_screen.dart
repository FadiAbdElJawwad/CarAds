import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../common/car_image_extractor.dart';
import '../../logic/provider/confirm_rent_provider.dart';
import '../../model/checkout_order.dart';
import '../widgets/checkout_priced_details.dart';

class ConfirmRentScreen extends StatelessWidget {
  final String orderId;
  final bool isViewMode;

  const ConfirmRentScreen({
    super.key,
    required this.orderId,
    this.isViewMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmRentProvider(orderId, context),
      child: Consumer<ConfirmRentProvider>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                kToolbarHeight + MediaQuery.of(context).padding.top,
              ),
              child: PrimaryAppBar(
                backIconVisible: true,
                text: isViewMode
                    ? (model.order?.purpose == 'rent'
                        ? context.loc.rentalReceiptTitle
                        : context.loc.purchaseReceiptTitle)
                    : (model.order?.purpose == 'rent'
                        ? context.loc.confirmRentTitle
                        : context.loc.confirmBuyTitle),
              ),
            ),
            bottomNavigationBar: isViewMode
                ? null
                : StickyBottomButton(
              text: model.order?.purpose == 'rent'
                  ? context.loc.confirmRentTitle
                  : context.loc.confirmBuyTitle,
              onPressed: () {
                AppRouter.goToAndRemove(
                  screenName: ScreenName.rentalCompletedScreen,
                );
              },
            ),
            body: model.isLoading
                ? const Center(child: CircularProgressIndicator())
                : model.error != null
                ? Center(child: Text(model.error!))
                : model.order == null
                ? Center(child: Text(context.loc.orderDetailsNotFound))
                : _buildOrderDetails(context, model.order!),
          );
        },
      ),
    );
  }

  Widget _buildOrderDetails(BuildContext context, CheckoutOrder order) {
    final currencyFormat = NumberFormat('#,###');
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(context.loc.shippingAddressLabel, style: context.bodyBold),
        context.addVerticalSpace(4),
        Card(
          child: ListTile(
            leading: Image.asset(ImagesManager.location),
            title: Text(context.loc.yourLocationLabel, style: context.bodyBold),
            subtitle: Text(
              order.location ?? context.loc.noAddressProvided,
              style: context.bodyRegular,
            ),
          ),
        ),
        context.addVerticalSpace(24),
        Text(context.loc.orderLabel, style: context.bodyBold),
        context.addVerticalSpace(8),
        Card(
          child: ListTile(
            leading: SizedBox(
              height: 50,
              width: 50,
              child: CarImageExtractor.buildImage(order.carImage, height: 50),
            ),
            title: Text(order.getLocalizedCarName(context), style: context.bodyBold),
            trailing: Text(
              '${currencyFormat.format(order.carPrice)}${context.loc.thousandSuffix} ${order.getLocalizedCurrency(context)}',
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
            title: Text(
              context.loc.drivingLicenseNoHint,
              style: context.inputRegular14.copyWith(fontSize: 12),
            ),
            subtitle: Text(order.licenseNumber, style: context.inputRegular14),
          ),
        ),
        context.addVerticalSpace(24),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: ColorManager.successColor),
          ),
          child: ListTile(
            title: Text(
              context.loc.idNumberHint,
              style: context.inputRegular14.copyWith(fontSize: 12),
            ),
            subtitle: Text(order.idNumber, style: context.inputRegular14),
          ),
        ),
        context.addVerticalSpace(24),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: ColorManager.successColor),
          ),
          child: ListTile(
            title: Text(
              context.loc.phoneNumberHint,
              style: context.inputRegular14.copyWith(fontSize: 12),
            ),
            subtitle: Text(order.phoneNumber, style: context.inputRegular14),
          ),
        ),
        context.addVerticalSpace(24),
        CheckoutPriceDetails(
          carPrice: order.carPrice,
          shippingCost: order.shippingCost,
          taxCost: order.taxCost,
          totalPayment: order.totalPayment,
          currencyFormat: currencyFormat,
          currency: order.getLocalizedCurrency(context),
        ),
      ],
    );
  }
}