import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:car_ads/features/explore/logic/helper/car_filter_helper.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CarFilterHelper', () {
    late List<CarCardModel> testCars;

    setUp(() {
      testCars = [
        CarCardModel(
          carId: '1',
          carName: 'Toyota Camry',
          carModel: 'Camry',
          price: '50', // 50,000 AED
          mileage: '10,000 km',
          year: '2022',
          status: 'available',
        ),
        CarCardModel(
          carId: '2',
          carName: 'Audi A4',
          carModel: 'A4',
          price: '100', // 100,000 AED
          mileage: '5,000 km',
          year: '2023',
          status: 'available',
        ),
        CarCardModel(
          carId: '3',
          carName: 'Toyota Corolla',
          carModel: 'Corolla',
          price: '40', // 40,000 AED
          mileage: '20,000 km',
          year: '2021',
          status: 'available',
        ),
      ];
    });

    test('should filter by search query (name)', () {
      final filter = FilterModel(
        searchQuery: 'Audi',
        priceRange: const RangeValues(
          0,
          200000,
        ), // Ensure price doesn't filter it out
      );
      final result = CarFilterHelper.filterCars(
        availableCars: testCars,
        filter: filter,
      );

      expect(result.length, 1);
      expect(result.first.carName, 'Audi A4');
    });

    test('should filter by price range', () {
      final filter = FilterModel(priceRange: const RangeValues(30000, 60000));
      final result = CarFilterHelper.filterCars(
        availableCars: testCars,
        filter: filter,
      );

      expect(result.length, 2);
      expect(result.any((c) => c.carId == '1'), true);
      expect(result.any((c) => c.carId == '3'), true);
    });

    test('should filter by mileage range', () {
      final filter = FilterModel(
        startMileage: 0,
        endMileage: 8000,
        priceRange: const RangeValues(0, 200000),
      );
      final result = CarFilterHelper.filterCars(
        availableCars: testCars,
        filter: filter,
      );

      expect(result.length, 1);
      expect(result.first.carId, '2');
    });

    test('should filter by year range', () {
      final filter = FilterModel(
        startYear: 2022,
        endYear: 2023,
        priceRange: const RangeValues(0, 200000),
      );
      final result = CarFilterHelper.filterCars(
        availableCars: testCars,
        filter: filter,
      );

      expect(result.length, 2);
      expect(result.any((c) => c.carId == '1'), true);
      expect(result.any((c) => c.carId == '2'), true);
    });

    test('should exclude specific carId', () {
      final filter = FilterModel(priceRange: const RangeValues(0, 200000));
      final result = CarFilterHelper.filterCars(
        availableCars: testCars,
        filter: filter,
        carId: '1',
      );

      expect(result.length, 2);
      expect(result.any((c) => c.carId == '1'), false);
    });
  });
}
