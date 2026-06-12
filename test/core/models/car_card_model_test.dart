import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CarCardModel', () {
    final testMap = {
      'carID': '1',
      'carImage': 'image_url',
      'carName': 'Toyota Camry',
      'carModel': 'Camry',
      'price': '50',
      'showroomName': 'Elite Motors',
      'showroomID': 's1',
      'gearType': 'Automatic',
      'carLogo': 'logo_url',
      'year': '2023',
      'mileage': '100',
      'fuel': 'Petrol',
      'seats': '5',
      'doors': '4',
      'contactName': 'John Doe',
      'contactPhone': '123456',
      'description': 'Great car',
    };

    test('should create model from map', () {
      final model = CarCardModel.fromMap(testMap);

      expect(model.carID, '1');
      expect(model.carName, 'Toyota Camry');
      expect(model.price, '50');
      expect(model.year, '2023');
    });

    test('should convert model to map', () {
      final model = CarCardModel.fromMap(testMap);
      final map = model.toMap();

      expect(map['carID'], '1');
      expect(map['carName'], 'Toyota Camry');
      expect(map['price'], '50');
      expect(map['year'], '2023');
    });

    test('should handle numeric price and year from Firestore map', () {
      final firestoreMap = Map<String, dynamic>.from(testMap);
      firestoreMap['price'] = 50;
      firestoreMap['year'] = 2023;

      final model = CarCardModel.fromMap(firestoreMap);

      expect(model.price, '50');
      expect(model.year, '2023');
    });

    test('should handle null values', () {
      final model = CarCardModel.fromMap({});

      expect(model.carID, isNull);
      expect(model.carName, isNull);
      expect(model.price, isNull);
    });
  });
}
