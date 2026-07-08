import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/features/home/model/map_selection_result.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/services/location_service.dart';

class MapProvider with ChangeNotifier {
  String _address = "Loading Location...";
  final LocationService _locationService = LocationService();
  LatLng? _currentPosition;

  String get address => _address;
  LatLng? get currentPosition => _currentPosition;

  Future<void> fetchLocation() async {
    _address = "Loading Location...";
    notifyListeners();
    try {
      Position position = await _locationService.getCurrentPosition();
      String fetchedAddress = await _locationService.getAddressFromLatLng(
        position.latitude,
        position.longitude,
      );
      _address = fetchedAddress;
      _currentPosition = LatLng(position.latitude, position.longitude);
    } catch (e) {
      AppLogger.error("Error fetching location", e);
      _address = "Tap on the map to select a location.";
    }
    notifyListeners();
  }

  Future<void> onMapTapped(LatLng position) async {
    _address = "Loading Location...";
    notifyListeners();
    try {
      String fetchedAddress = await _locationService.getAddressFromLatLng(
        position.latitude,
        position.longitude,
      );
      _address = fetchedAddress;
      _currentPosition = position;
    } catch (e) {
      AppLogger.error("Error fetching address", e);
      _address = "Could not determine address. Please try again.";
    }
    notifyListeners();
  }

  void onSetLocationPressed(BuildContext context) {
    if (_address != "Loading Location..." &&
        _address != "Unable to determine your location." &&
        _address != "Tap on the map to select a location." &&
        _address != "Could not determine address. Please try again.") {
      final result = MapSelectionResult(
        address: _address,
        position: _currentPosition!,
      );
      Navigator.of(context).pop(result);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a location on the map')),
      );
    }
  }
}
