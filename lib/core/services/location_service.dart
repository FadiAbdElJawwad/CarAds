import 'package:car_ads/core/app_logger.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService._internal();
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      final geocodingInstance = Geocoding();
      final List<Placemark> placemarks = await geocodingInstance.placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isEmpty) {
        return "Unknown Location";
      }

      final Placemark place = placemarks[0];

      return "${place.street ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}";
    } catch (e) {
      AppLogger.error("Error getting address from coordinates", e);
      rethrow;
    }
  }
}
