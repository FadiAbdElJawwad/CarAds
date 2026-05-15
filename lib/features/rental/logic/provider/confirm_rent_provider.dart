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

  ConfirmRentProvider(this.orderId) {
    _fetchOrderDetails();
  }

  Future<void> _fetchOrderDetails() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final snapshot = await _checkoutService.getCheckoutOrder(orderId);
      if (snapshot.exists && snapshot.data() != null) {
        _order = CheckoutOrder.fromMap(snapshot.data()!);
      } else {
        _error = 'Order details not found.';
      }
    } catch (e) {
      _error = 'Error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
