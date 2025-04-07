import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/components/custom_map.dart';
import 'package:genclik_spor/screens/common/components/map_component.dart';
import 'package:genclik_spor/screens/common/gyms/components/gym_slider.dart';
import 'package:genclik_spor/screens/common/gyms/gym_detail_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';
import 'package:latlong2/latlong.dart' as latLng;

class GymsScreen extends ConsumerWidget {
  GymsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        //Expanded(child: MapComponent()),
        Expanded(
            child: CustomMap(
          markers: [
            Marker(
              point: latLng.LatLng(37.06406415751307, 37.362847029935075),
              child: const Icon(Icons.abc_rounded),
            ),
          ],
        )),
        Expanded(child: GymSlider()),
      ],
    );
  }
}
