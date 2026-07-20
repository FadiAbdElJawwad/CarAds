import 'package:geolocator/geolocator.dart';

class MapSelectionResult {
  final String address;
  final Position position;

  MapSelectionResult({required this.address, required this.position});
}
