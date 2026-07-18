import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/extension/rental_date_extension.dart';
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
  Future<void> _pickStartDate(CheckoutProvider model) async {
    final date = await showDatePicker(
      context: context,
      initialDate: widget.car.showroomStartDate,
      firstDate: widget.car.showroomStartDate,
      lastDate: widget.car.showroomEndDate,
    );
    if (date != null) {
      setState(() {
        model.rentalFromDate = date;
      });
    }
  }

  Future<void> _pickEndDate(CheckoutProvider model) async {
    final date = await showDatePicker(
      context: context,
      initialDate: model.rentalFromDate ?? widget.car.showroomStartDate,
      firstDate: model.rentalFromDate ?? widget.car.showroomStartDate,
      lastDate: widget.car.showroomEndDate,
    );
    if (date != null) {
      setState(() {
        model.rentalUntilDate = date;
      });
    }
  }

  Future<void> _pickStartTime(CheckoutProvider model) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      if (model.rentalFromDate != null &&
          DateUtils.isSameDay(model.rentalFromDate!, widget.car.showroomStartDate)) {
        final showroomStartTime = widget.car.parseTime(widget.car.startTime);
        if (widget.car.timeToMinutes(pickedTime) <
            widget.car.timeToMinutes(showroomStartTime)) {
          if (mounted) {
            showSnackBar(
              context,
              'Car is only available from ${showroomStartTime.format(context)} on this day.',
            );
          }
          return;
        }
      }
      setState(() {
        model.rentalFromTime = pickedTime;
      });
    }
  }

  Future<void> _pickEndTime(CheckoutProvider model) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      if (model.rentalUntilDate != null &&
          DateUtils.isSameDay(model.rentalUntilDate!, widget.car.showroomEndDate)) {
        final showroomEndTime = widget.car.parseTime(widget.car.endTime);
        if (widget.car.timeToMinutes(pickedTime) >
            widget.car.timeToMinutes(showroomEndTime)) {
          if (mounted) {
            showSnackBar(
              context,
              'Car must be returned by ${showroomEndTime.format(context)} on the final day.',
            );
          }
          return;
        }
      }
      setState(() {
        model.rentalUntilTime = pickedTime;
      });
    }
  }

  void _processCheckout(CheckoutProvider model) {
    final isRent = widget.car.purpose == 'rent';

    if (isRent) {
      if (model.rentalFromDate == null ||
          model.rentalUntilDate == null ||
          model.rentalFromTime == null ||
          model.rentalUntilTime == null) {
        showSnackBar(
          context,
          'Please select the complete rental period (Dates and Times).',
        );
        return;
      }
    }

    model.onContinue(context);
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat('#,###');
    final carPrice = (int.tryParse(widget.car.price ?? '') ?? 0) * 1000;
    final totalPayment =
        carPrice + AppConstants.shippingCost + AppConstants.taxCost;

    return ChangeNotifierProvider(
      create: (_) => CheckoutProvider(widget.car),
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
            body: LoadingOverlay(
              isLoading: model.isLoading,
              child: Form(
                key: model.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    CheckoutCarSummary(car: widget.car),
                    context.addVerticalSpace(24),
                    Text('Shipping Address', style: context.bodyBold),
                    context.addVerticalSpace(8),
                    SizedBox(height: 150, child: LocationWidget(model: model)),
                    context.addVerticalSpace(24),
                    CheckoutFormFields(
                      licenseController: model.licenseController,
                      idController: model.idController,
                      phoneController: model.phoneController,
                    ),
                    if (widget.car.purpose == 'rent')
                      CheckoutRentalSection(
                        userStartDate: model.rentalFromDate,
                        userStartTime: model.rentalFromTime,
                        userEndDate: model.rentalUntilDate,
                        userEndTime: model.rentalUntilTime,
                        onPickStartDate: () => _pickStartDate(model),
                        onPickStartTime: () => _pickStartTime(model),
                        onPickEndDate: () => _pickEndDate(model),
                        onPickEndTime: () => _pickEndTime(model),
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
            ),
            bottomNavigationBar: StickyBottomButton(
              text: widget.car.purpose == 'rent' ? 'Confirm Rental' : 'Confirm Purchase',
              onPressed: model.isLoading ? null : () => _processCheckout(model),
              isLoading: model.isLoading,
            ),
          );
        },
      ),
    );
  }
}
