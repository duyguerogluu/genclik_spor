import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMap extends StatelessWidget {
  final LatLng center;
  final double zoom;
  final List<Marker> markers;

  const CustomMap({
    Key? key,
    this.center = const LatLng(37.06406415751307, 37.362847029935075),
    this.zoom = 13.0,
    this.markers = const [
      Marker(
        point: LatLng(37.06406415751307, 37.362847029935075),
        child: Icon(Icons.abc_rounded),
      ),
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: center,
        initialZoom: zoom,
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
          subdomains: ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.genclik_spor',
        ),
        MarkerLayer(
          markers: markers,
        ),
      ],
    );
  }
}
