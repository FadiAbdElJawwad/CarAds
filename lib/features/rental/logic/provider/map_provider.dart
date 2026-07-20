import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/features/home/model/map_selection_result.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/services/location_service.dart';

class MapProvider with ChangeNotifier {
  String address = "";
  bool isLoading = false;
  final LocationService _locationService = LocationService();
  Position? _currentPosition;

  Position? get currentPosition => _currentPosition;

  Future<void> fetchLocation(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      Position position = await _locationService.getCurrentPosition(context);
      _currentPosition = position;

      if (!context.mounted) return;
      String fetchedAddress = await _locationService.getAddressFromLatLng(
        context,
        position.latitude,
        position.longitude,
      );
      address = fetchedAddress;
    } catch (e) {
      if (context.mounted) {
        address = _currentPosition != null
            ? "${_currentPosition!.latitude}, ${_currentPosition!.longitude}"
            : context.loc.unknownLocation;
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> onMapTapped(BuildContext context, Position position) async {
    isLoading = true;
    notifyListeners();
    try {
      String fetchedAddress = await _locationService.getAddressFromLatLng(
        context,
        position.latitude,
        position.longitude,
      );
      if (!context.mounted) return;
      address = fetchedAddress;
      _currentPosition = position;
    } catch (e) {
      AppLogger.error("Error fetching address", e);
      if (context.mounted) {
        address = context.loc.couldNotDetermineAddress;
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> onSetLocationPressed(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      Position position = await _locationService.getCurrentPosition(context);
      if (!context.mounted) return;

      String fetchedAddress = await _locationService.getAddressFromLatLng(
        context,
        position.latitude,
        position.longitude,
      );

      address = fetchedAddress;
      _currentPosition = position;
      notifyListeners();

      await Future.delayed(const Duration(milliseconds: 600));
      if (context.mounted) {
        Navigator.of(context).pop(
          MapSelectionResult(address: address, position: _currentPosition!),
        );
      }
    } catch (e) {
      if (context.mounted) {
        address = context.loc.unknownLocation;
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
