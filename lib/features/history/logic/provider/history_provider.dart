import 'dart:async';
import 'package:flutter/material.dart';
import '../../model/history_order.dart';
import '../service/history_service.dart';

class HistoryProvider with ChangeNotifier {
  final HistoryService _historyService = HistoryService();
  StreamSubscription? _orderSubscription;
  List<HistoryOrder> _orders = [];
  bool _isLoading = true;
  String? _userId;

  List<HistoryOrder> get orders => _orders;

  bool get isLoading => _isLoading;

  void init(String userId) {
    if (_userId == userId) return;
    _userId = userId;
    fetchHistory();
  }

  void fetchHistory() {
    if (_userId == null) return;
    _isLoading = true;
    notifyListeners();
    _orderSubscription?.cancel();
    _orderSubscription = _historyService.getOrderHistory(_userId!).listen((
      orders,
    ) {
      _orders = orders;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> clearHistory() async {
    if (_userId == null) return;
    await _historyService.clearHistory(_userId!);
  }

  @override
  void dispose() {
    _orderSubscription?.cancel();
    super.dispose();
  }
}
