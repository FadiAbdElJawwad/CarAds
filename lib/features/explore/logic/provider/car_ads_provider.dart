import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterModel {
  String brand;
  String condition;
  RangeValues priceRange;
  int? startMileage;
  int? endMileage;
  int? startYear;
  int? endYear;
  String searchQuery;

  FilterModel({
    this.brand = 'All Cars',
    this.condition = 'All',
    this.priceRange = const RangeValues(3000, 32000),
    this.startMileage,
    this.endMileage,
    this.startYear,
    this.endYear,
    this.searchQuery = '',
  });

  FilterModel copyWith({
    String? brand,
    String? condition,
    RangeValues? priceRange,
    int? startMileage,
    int? endMileage,
    int? startYear,
    int? endYear,
    String? searchQuery,
  }) {
    return FilterModel(
      brand: brand ?? this.brand,
      condition: condition ?? this.condition,
      priceRange: priceRange ?? this.priceRange,
      startMileage: startMileage ?? this.startMileage,
      endMileage: endMileage ?? this.endMileage,
      startYear: startYear ?? this.startYear,
      endYear: endYear ?? this.endYear,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class CarAdsProvider with ChangeNotifier {
  FilterModel _filter = FilterModel();
  FilterModel _tempFilter = FilterModel();
  List<String> _recentSearches = [];
  static const String _recentSearchesKey = 'recent_searches_list';

  CarAdsProvider() {
    _loadRecentSearches();
  }

  FilterModel get filter => _filter;
  FilterModel get tempFilter => _tempFilter;
  List<String> get recentSearches => _recentSearches;

  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    _recentSearches =
        prefs.getStringList(_recentSearchesKey) ??
        ['Toyota', 'Audi', 'Hyundai', 'Mazda'];
    notifyListeners();
  }

  Future<void> _saveRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_recentSearchesKey, _recentSearches);
  }

  void initTempFilter() {
    _tempFilter = _filter.copyWith();
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _filter = _filter.copyWith(searchQuery: query);
    notifyListeners();
  }

  void addRecentSearch(String query) {
    String trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) return;

    _recentSearches.removeWhere(
      (s) => s.toLowerCase() == trimmedQuery.toLowerCase(),
    );
    _recentSearches.insert(0, trimmedQuery);

    if (_recentSearches.length > 10) {
      _recentSearches = _recentSearches.sublist(0, 10);
    }

    _saveRecentSearches();
    notifyListeners();
  }

  void removeRecentSearch(String query) {
    _recentSearches.remove(query);
    _saveRecentSearches();
    notifyListeners();
  }

  void clearRecentSearches() {
    _recentSearches.clear();
    _saveRecentSearches();
    notifyListeners();
  }

  void setBrand(String brand) {
    _tempFilter = _tempFilter.copyWith(brand: brand);
    notifyListeners();
  }

  void setCondition(String condition) {
    _tempFilter = _tempFilter.copyWith(condition: condition);
    notifyListeners();
  }

  void setPriceRange(RangeValues values) {
    _tempFilter = _tempFilter.copyWith(priceRange: values);
    notifyListeners();
  }

  void setMileage(int? start, int? end) {
    _tempFilter = _tempFilter.copyWith(startMileage: start, endMileage: end);
    notifyListeners();
  }

  void setYear(int? start, int? end) {
    _tempFilter = _tempFilter.copyWith(startYear: start, endYear: end);
    notifyListeners();
  }

  void setBrandAndApply(String brand) {
    _filter = _filter.copyWith(brand: brand);
    _tempFilter = _tempFilter.copyWith(brand: brand);
    notifyListeners();
  }

  void applyFilter() {
    _filter = _tempFilter.copyWith();
    notifyListeners();
  }

  void resetFilter() {
    _filter = FilterModel();
    _tempFilter = FilterModel();
    notifyListeners();
  }

  void updateTempFilter(FilterModel newFilter) {
    _tempFilter = newFilter;
    notifyListeners();
  }
}
