import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatelessWidget {
  final LatLng center;
  final double zoom;
  final Set<Marker> markers;
  final MapType mapType;
  final void Function(GoogleMapController)? onMapCreated;

  const CustomMap({
    super.key,
    required this.center,
    this.zoom = 13.0,
    this.markers = const {},
    this.mapType = MapType.normal,
    this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: zoom,
      ),
      markers: markers,
      mapType: mapType,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: onMapCreated,
    );
  }
}
