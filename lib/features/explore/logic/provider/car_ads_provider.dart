import 'dart:async';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/services/car_firestore_service.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:car_ads/generated/l10n.dart';
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
    String? brand,
    String? condition,
    this.priceRange = const RangeValues(
      AppConstants.minPrice,
      AppConstants.maxPrice,
    ),
    this.startMileage,
    this.endMileage,
    this.startYear,
    this.endYear,
    this.searchQuery = '',
  })  : brand = brand ?? S.current.allCars,
        condition = condition ?? S.current.all;

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
  final CarFirestoreService _firestoreService = CarFirestoreService();
  StreamSubscription? _carsSubscription;

  List<CarCardModel> _availableCars = [];
  List<CarCardModel> _filteredCars = [];
  bool _isLoading = false;
  String? _errorMessage;

  FilterModel _filter = FilterModel();
  FilterModel _tempFilter = FilterModel();
  List<String> _recentSearches = [];
  static const String _recentSearchesKey = 'recent_searches_list';

  CarAdsProvider() {
    _loadRecentSearches();
    fetchAvailableCars();
  }

  List<CarCardModel> get availableCars => _availableCars;
  List<CarCardModel> get filteredCars => _filteredCars;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  FilterModel get filter => _filter;
  FilterModel get tempFilter => _tempFilter;
  List<String> get recentSearches => _recentSearches;

  void fetchAvailableCars() {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    _carsSubscription?.cancel();
    _carsSubscription = _firestoreService
        .getCarsStream(onlyAvailable: true)
        .listen(
          (snapshot) {
        _availableCars = snapshot.docs.map((doc) {
          try {
            return CarCardModel.fromMap(doc.data() as Map<String, dynamic>);
          } catch (e) {
            rethrow;
          }
        }).toList();

        _applyFilters();
        _isLoading = false;
        notifyListeners();
      },
      onError: (error) {
        _errorMessage = S.current.loadCarsFailed(error.toString());
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void _applyFilters() {
    List<CarCardModel> temp = List.from(_availableCars);

    final brandQuery = filter.brand.trim().toLowerCase();

    bool isDefaultTab =
        brandQuery.isEmpty ||
            brandQuery == "all" ||
            brandQuery == "all cars" ||
            brandQuery == "brands" ||
            brandQuery == S.current.all.toLowerCase() ||
            brandQuery == S.current.allCars.toLowerCase() ||
            brandQuery == S.current.allCategories.toLowerCase() ||
            brandQuery == S.current.brands.toLowerCase();

    if (!isDefaultTab) {
      temp = temp.where((car) {
        final cName = car.carName?.trim().toLowerCase() ?? '';
        final cModel = car.carModel?.trim().toLowerCase() ?? '';

        return cName.contains(brandQuery) || cModel.contains(brandQuery);
      }).toList();
    }

    temp = temp.where((car) {
      final carPrice = (int.tryParse(car.price ?? '0') ?? 0) * 1000;
      return carPrice >= filter.priceRange.start &&
          carPrice <= filter.priceRange.end;
    }).toList();

    if (filter.startMileage != null || filter.endMileage != null) {
      temp = temp.where((car) {
        final carMileage =
            int.tryParse(
              car.mileage?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0',
            ) ??
                0;
        bool match = true;
        if (filter.startMileage != null) {
          match &= (carMileage >= filter.startMileage!);
        }
        if (filter.endMileage != null) {
          match &= (carMileage <= filter.endMileage!);
        }
        return match;
      }).toList();
    }

    if (filter.startYear != null || filter.endYear != null) {
      temp = temp.where((car) {
        final carYear = int.tryParse(car.year?.toString() ?? '0') ?? 0;
        bool match = true;
        if (filter.startYear != null) match &= (carYear >= filter.startYear!);
        if (filter.endYear != null) match &= (carYear <= filter.endYear!);
        return match;
      }).toList();
    }

    final textQuery = filter.searchQuery.trim().toLowerCase();
    if (textQuery.isNotEmpty) {
      temp = temp.where((car) {
        final title = car.carName?.trim().toLowerCase() ?? '';
        final model = car.carModel?.trim().toLowerCase() ?? '';
        return title.contains(textQuery) || model.contains(textQuery);
      }).toList();
    }

    _filteredCars = temp;
  }

  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    _recentSearches =
        prefs.getStringList(_recentSearchesKey) ??
            [
              S.current.toyota,
              S.current.audi,
              S.current.hyundai,
              S.current.mazda,
            ];
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
    _applyFilters();
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
    _applyFilters();
    notifyListeners();
  }

  void applyFilter() {
    _filter = _tempFilter.copyWith();
    _applyFilters();
    notifyListeners();
  }

  void resetFilter() {
    _filter = FilterModel();
    _tempFilter = FilterModel();
    _applyFilters();
    notifyListeners();
  }

  void updateTempFilter(FilterModel newFilter) {
    _tempFilter = newFilter;
    notifyListeners();
  }

  @override
  void dispose() {
    _carsSubscription?.cancel();
    super.dispose();
  }
}