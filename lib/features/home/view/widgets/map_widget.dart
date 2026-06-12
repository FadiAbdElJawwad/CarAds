import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  final LatLng? currentPosition;
  final Function(LatLng) onMapTapped;

  const MapWidget({
    super.key,
    required this.currentPosition,
    required this.onMapTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      onTap: onMapTapped,
      initialCameraPosition: CameraPosition(
        target: currentPosition ?? const LatLng(31.5, 34.4667),
        zoom: currentPosition == null ? 9 : 15,
      ),
      markers: {
        if (currentPosition != null)
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: currentPosition!,
          ),
      },
    );
  }
}
