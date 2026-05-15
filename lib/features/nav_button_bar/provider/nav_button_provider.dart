import 'package:flutter/material.dart';

class NavButtonProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onItemTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
