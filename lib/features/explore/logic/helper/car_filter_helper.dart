import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import '../../model/car_card_model.dart';

class CarFilterHelper {
  static List<CarCardModel> filterCars({
    required List<CarCardModel> availableCars,
    required FilterModel filter,
    String? carId,
  }) {
    return availableCars.where((car) {
      if (carId != null && car.carId == carId) return false;

      // Safety check: ensure only available cars are shown in global lists
      if (car.status != 'available' && carId == null) return false;

      bool match = true;

      // Price Filter
      final carPrice = (int.tryParse(car.price ?? '0') ?? 0) * 1000;
      match &=
          (carPrice >= filter.priceRange.start &&
          carPrice <= filter.priceRange.end);

      // Mileage Filter
      if (filter.startMileage != null || filter.endMileage != null) {
        final carMileage =
            int.tryParse(
              car.mileage?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0',
            ) ??
            0;
        if (filter.startMileage != null) {
          match &= (carMileage >= filter.startMileage!);
        }
        if (filter.endMileage != null) {
          match &= (carMileage <= filter.endMileage!);
        }
      }

      // Year Filter
      if (filter.startYear != null || filter.endYear != null) {
        final carYear = int.tryParse(car.year?.toString() ?? '0') ?? 0;
        if (filter.startYear != null) match &= (carYear >= filter.startYear!);
        if (filter.endYear != null) match &= (carYear <= filter.endYear!);
      }

      // Search Query Filter
      if (filter.searchQuery.isNotEmpty) {
        final query = filter.searchQuery.toLowerCase();
        final carName = car.carName?.toLowerCase() ?? '';
        final carModel = car.carModel?.toLowerCase() ?? '';
        match &= (carName.contains(query) || carModel.contains(query));
      }

      return match;
    }).toList();
  }
}
