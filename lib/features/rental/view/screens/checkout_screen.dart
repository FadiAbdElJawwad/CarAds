import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/rental/logic/provider/checkout_provider.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../widgets/checkout_car_summary.dart';
import '../widgets/checkout_form_fields.dart';
import '../widgets/checkout_order_summary.dart';
import '../widgets/checkout_priced_details.dart';
import '../widgets/checkout_rental_section.dart';
import '../widgets/location_widget.dart';

class Checkout extends StatefulWidget {
  final CarCardModel car;
  const Checkout({super.key, required this.car});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat('#,###');
    final carPrice = (int.tryParse(widget.car.price ?? '') ?? 0) * 1000;
    final totalPayment =
        carPrice + AppConstants.shippingCost + AppConstants.taxCost;

    return ChangeNotifierProvider(
      create: (_) => CheckoutProvider(widget.car),
      child: Builder(
        builder: (context) {
          final model = context.read<CheckoutProvider>();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (model.isLocationLoading &&
                !model.locationFetchFailed &&
                model.shippingAddress == null) {
              model.fetchInitialLocation(context);
            }
          });

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                kToolbarHeight + MediaQuery.of(context).padding.top,
              ),
              child: PrimaryAppBar(
                backIconVisible: true,
                text: context.loc.checkoutTitle,
              ),
            ),
            body: Form(
              key: model.formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  CheckoutCarSummary(car: widget.car),
                  context.addVerticalSpace(24),
                  Text(context.loc.shippingAddressLabel, style: context.bodyBold),
                  context.addVerticalSpace(8),
                  Selector<CheckoutProvider, bool>(
                    selector: (_, p) => p.isLocationLoading,
                    builder: (context, isLoading, child) {
                      return SizedBox(
                        height: context.screenHeight(150),
                        child: LocationWidget(model: model),
                      );
                    },
                  ),
                  context.addVerticalSpace(24),
                  CheckoutFormFields(
                    licenseController: model.licenseController,
                    idController: model.idController,
                    phoneController: model.phoneController,
                  ),
                  if (widget.car.purpose == 'rent')
                    Consumer<CheckoutProvider>(
                      builder: (context, p, _) {
                        return CheckoutRentalSection(
                          userStartDate: p.rentalFromDate,
                          userStartTime: p.rentalFromTime,
                          userEndDate: p.rentalUntilDate,
                          userEndTime: p.rentalUntilTime,
                          onPickStartDate: () => p.pickStartDate(context),
                          onPickStartTime: () => p.pickStartTime(context),
                          onPickEndDate: () => p.pickEndDate(context),
                          onPickEndTime: () => p.pickEndTime(context),
                        );
                      },
                    ),
                  context.addVerticalSpace(24),
                  CheckoutOrderSummary(
                    car: widget.car,
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
                  context.addVerticalSpace(24),
                ],
              ),
            ),
            bottomNavigationBar: Selector<CheckoutProvider, bool>(
              selector: (_, p) => p.isLoading,
              builder: (context, isLoading, _) {
                return StickyBottomButton(
                  text: widget.car.purpose == 'rent'
                      ? context.loc.confirmRentalButton
                      : context.loc.confirmPurchaseButton,
                  onPressed: isLoading ? null : () => model.onContinue(context),
                  isLoading: isLoading,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
