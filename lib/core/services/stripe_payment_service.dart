import 'dart:convert';
import 'package:car_ads/core/constant/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import '../app_logger.dart';

class StripePaymentService {
  StripePaymentService._internal();
  static final StripePaymentService _instance =
      StripePaymentService._internal();
  factory StripePaymentService() => _instance;

  Future<bool> makePayment({
    required int amountInDollars,
    String currency = 'usd',
  }) async {
    try {
      int amountInCents = amountInDollars * 100;

      AppLogger.info(
        "Fetching Payment Intent for $amountInDollars $currency...",
      );
      String? clientSecret = await _fetchPaymentIntent(amountInCents, currency);

      if (clientSecret == null) {
        AppLogger.error(
          "Client Secret acquisition failed. Aborting transaction.",
        );
        return false;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'CarAds Inc.',
          style: ThemeMode.light,
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(primary: Colors.black),
          ),
        ),
      );

      // Display Payment Sheet to user
      await Stripe.instance.presentPaymentSheet();

      AppLogger.info("Transaction confirmed successfully via Stripe.");
      return true;
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        AppLogger.warning("User manually cancelled the payment process.");
      } else {
        AppLogger.error("Stripe SDK Exception: ${e.error.localizedMessage}");
      }
      return false;
    } catch (e) {
      AppLogger.error("Architectural Payment Failure: $e");
      return false;
    }
  }

  Future<String?> _fetchPaymentIntent(int amount, String currency) async {
    try {
      var response = await http.post(
        Uri.parse(ApiConstants.stripePaymentUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'action': 'createPaymentIntent',
          'amount': amount.toString(),
          'currency': currency,
        }),
      );

      if (response.statusCode == 302) {
        final location = response.headers['location'];
        if (location != null) {
          response = await http.get(Uri.parse(location));
        }
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return data['client_secret'];
        }
        AppLogger.error("Backend returned logic error: ${data['message']}");
      } else {
        AppLogger.error("API link failure. Status: ${response.statusCode}");
      }
      return null;
    } catch (e) {
      AppLogger.error("GAS Bridge Communication Error: $e");
      return null;
    }
  }
}
