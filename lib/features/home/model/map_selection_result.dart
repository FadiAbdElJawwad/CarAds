import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSelectionResult {
  final String address;
  final LatLng position;

  MapSelectionResult({required this.address, required this.position});
}
