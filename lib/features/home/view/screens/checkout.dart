import 'dart:async';
import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/features/home/model/car_card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 import 'package:intl/intl.dart';
import '../../../../core/routes/screen_name.dart';
import '../../logic/helper/checkout_helper.dart';
import '../../logic/helper/checkout_form_manager.dart';
import '../../logic/helper/checkout_ui_helper.dart';
import '../../logic/service/checkout_service.dart';
import '../widgets/checkout_date_selector.dart';
import '../widgets/checkout_form_fields.dart';
import '../widgets/checkout_order_summary.dart';
import '../widgets/checkout_priced_details.dart';

class Checkout extends StatefulWidget {
  final CarCardModel car;
  const Checkout({super.key, required this.car});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late final CheckoutFormManager _formManager;
  late final CheckoutUiHelper _uiHelper;
  final CheckoutService _checkoutService = CheckoutService();
  final _currencyFormat = NumberFormat('#,###');

  @override
  void initState() {
    super.initState();
    _formManager = CheckoutFormManager();
    _uiHelper = CheckoutUiHelper(context);
  }

  @override
  void dispose() {
    _formManager.dispose();
    super.dispose();
  }


  int get _carPrice => (int.tryParse(widget.car.price ?? '') ?? 0) * 1000;
  int get _totalPayment => _carPrice + AppConstants.shippingCost + AppConstants.taxCost;

  Future<void> _onContinue() async {
    if (!_formManager.isValid) {

      if (_formManager.rentalFromDate == null) {
        _uiHelper.showSnackBar('Please select rental dates');
      }
      return;
    }

    _uiHelper.showLoading();

    try {
      final checkoutData = _formManager.createCheckoutData(
        car: widget.car,
        totalPayment: _totalPayment,
        carPrice: _carPrice,
        shippingCost: AppConstants.shippingCost,
        taxCost: AppConstants.taxCost,
        currency: AppConstants.currency,
      );

      final DocumentReference orderRef = await _checkoutService.submitCheckoutData(checkoutData);
      final String orderId = orderRef.id;

      if (mounted) {
        _uiHelper.hideLoading();
        AppRouter.goTo(screenName: ScreenName.mapScreen, arguments: orderId);
      }
    } catch (e) {
      if (mounted) {
        _uiHelper.hideLoading();
        _uiHelper.showSnackBar('Error uploading data: $e');
      }
    }
  }

  Future<void> _pickDate(bool isStart) async {
    final date = await CheckoutHelper.selectDate(context);
    if (date == null) return;

    setState(() {
      if (isStart) {
        _formManager.rentalFromDate = date;
      } else {
        _formManager.rentalUntilDate = date;
      }
    });
  }

  Future<void> _pickTime(bool isStart) async {
    final time = await CheckoutHelper.selectTime(context);
    if (time == null) return;

    setState(() {
      if (isStart) {
        _formManager.rentalFromTime = time;
      } else {
        _formManager.rentalUntilTime = time;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).padding.top),
        child: const PrimaryAppBar(backIconVisible: true, text: 'Checkout'),
      ),
      body: Form(
        key: _formManager.formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('Shipping Address', style: context.bodyBold),
            context.addVerticalSpace(8),

            Image.asset(ImagesManager.map, height: 150, width: double.infinity, fit: BoxFit.cover),
            context.addVerticalSpace(24),
            CheckoutFormFields(
              licenseController: _formManager.licenseController,
              idController: _formManager.idController,
              phoneController: _formManager.phoneController,
            ),
            context.addVerticalSpace(24),
            CheckoutDateSelector(
              label: 'Rental From',
              currentDate: _formManager.rentalFromDate,
              currentTime: _formManager.rentalFromTime,
              onSelectDate: () => _pickDate(true),
              onSelectTime: () => _pickTime(true),
            ),
            context.addVerticalSpace(16),
            CheckoutDateSelector(
              label: 'Rental Until',
              currentDate: _formManager.rentalUntilDate,
              currentTime: _formManager.rentalUntilTime,
              onSelectDate: () => _pickDate(false),
              onSelectTime: () => _pickTime(false),
            ),
            context.addVerticalSpace(24),
            CheckoutOrderSummary(
              car: widget.car,
              carPrice: _carPrice,
              currencyFormat: _currencyFormat,
              currency: AppConstants.currency,
            ),
            context.addVerticalSpace(24),
            CheckoutPriceDetails(
              carPrice: _carPrice,
              shippingCost: AppConstants.shippingCost,
              taxCost: AppConstants.taxCost,
              totalPayment: _totalPayment,
              currencyFormat: _currencyFormat,
              currency: AppConstants.currency,
            ),
            context.addVerticalSpace(40),
            PrimaryButton(text: 'Continue to payment', onPressed: _onContinue),
          ],
        ),
      ),
    );
  }
}