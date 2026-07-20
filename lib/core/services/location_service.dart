import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService._internal();
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;

  Future<Position> getCurrentPosition(BuildContext context) async {
    final loc = context.loc;
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception(loc.locationServicesDisabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(loc.locationPermissionsDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(loc.locationPermissionsPermanentlyDenied);
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddressFromLatLng(BuildContext context, double latitude, double longitude) async {
    final loc = context.loc;
    try {
      final geocodingInstance = Geocoding();
      final List<Placemark> placemarks = await geocodingInstance.placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isEmpty) {
        return loc.unknownLocation;
      }

      final Placemark place = placemarks[0];

      return "${place.street ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}";
    } catch (e) {
      AppLogger.error("Error getting address from coordinates", e);
      rethrow;
    }
  }
}