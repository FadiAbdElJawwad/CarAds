import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../model/checkout_order.dart';
import '../service/checkout_service.dart';

class ConfirmRentProvider with ChangeNotifier {
  final String orderId;
  final CheckoutService _checkoutService = CheckoutService();

  CheckoutOrder? _order;
  CheckoutOrder? get order => _order;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  ConfirmRentProvider(this.orderId, BuildContext context) {
    _fetchOrderDetails(context);
  }

  Future<void> _fetchOrderDetails(BuildContext context) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final snapshot = await _checkoutService.getCheckoutOrder(orderId);
      if (snapshot.exists && snapshot.data() != null) {
        _order = CheckoutOrder.fromMap(snapshot.data()!);
      } else {
        _error = context.loc.orderDetailsNotFound;
      }
    } catch (e) {
      _error = context.loc.errorWithDetails(e.toString());
    }

    _isLoading = false;
    notifyListeners();
  }
}