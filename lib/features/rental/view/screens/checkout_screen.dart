import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/rental/logic/provider/checkout_provider.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:car_ads/features/home/view/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../widgets/checkout_date_selector.dart';
import '../widgets/checkout_form_fields.dart';
import '../widgets/checkout_order_summary.dart';
import '../widgets/checkout_priced_details.dart';

class Checkout extends StatelessWidget {
  final CarCardModel car;
  const Checkout({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat('#,###');
    final carPrice = (int.tryParse(car.price ?? '') ?? 0) * 1000;
    final totalPayment =
        carPrice + AppConstants.shippingCost + AppConstants.taxCost;

    return ChangeNotifierProvider(
      create: (_) => CheckoutProvider(car),
      child: Consumer<CheckoutProvider>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                kToolbarHeight + MediaQuery.of(context).padding.top,
              ),
              child: const PrimaryAppBar(
                backIconVisible: true,
                text: 'Checkout',
              ),
            ),
            body: Form(
              key: model.formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text('Shipping Address', style: context.bodyBold),
                  context.addVerticalSpace(8),
                  SizedBox(height: 150, child: LocationWidget(model: model)),
                  context.addVerticalSpace(24),
                  CheckoutFormFields(
                    licenseController: model.licenseController,
                    idController: model.idController,
                    phoneController: model.phoneController,
                  ),
                  context.addVerticalSpace(24),
                  CheckoutDateSelector(
                    label: 'Rental From',
                    currentDate: model.rentalFromDate,
                    currentTime: model.rentalFromTime,
                    onSelectDate: () => model.pickDate(context, true),
                    onSelectTime: () => model.pickTime(context, true),
                  ),
                  context.addVerticalSpace(16),
                  CheckoutDateSelector(
                    label: 'Rental Until',
                    currentDate: model.rentalUntilDate,
                    currentTime: model.rentalUntilTime,
                    onSelectDate: () => model.pickDate(context, false),
                    onSelectTime: () => model.pickTime(context, false),
                  ),
                  context.addVerticalSpace(24),
                  CheckoutOrderSummary(
                    car: car,
                    carPrice: carPrice,
                    currencyFormat: currencyFormat,
                    currency: AppConstants.currency,
                  ),
                  context.addVerticalSpace(24),
                  CheckoutPriceDetails(
                    carPrice: carPrice,
                    shippingCost: AppConstants.shippingCost,
                    taxCost: AppConstants.taxCost,
                    totalPayment: totalPayment,
                    currencyFormat: currencyFormat,
                    currency: AppConstants.currency,
                  ),
                  context.addVerticalSpace(40),
                  PrimaryButton(
                    text: model.isLoading
                        ? 'Loading...'
                        : 'Continue to payment',
                    onPressed: model.isLoading
                        ? null
                        : () => model.onContinue(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
