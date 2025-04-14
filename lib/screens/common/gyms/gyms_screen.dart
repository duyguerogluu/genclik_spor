import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/components/custom_map.dart';
import 'package:genclik_spor/screens/common/gyms/components/gym_slider.dart';
import 'package:genclik_spor/screens/common/gyms/gym_detail_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:latlong2/latlong.dart';

class GymsScreen extends ConsumerStatefulWidget {
  const GymsScreen({super.key});

  @override
  _GymsScreenState createState() => _GymsScreenState();
}

class _GymsScreenState extends ConsumerState<GymsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gymRiverpod.notifier).fetchGyms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final gyms = ref.watch(gymRiverpod).gyms;

    return gyms.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                flex: 2,
                child: CustomMap(
                  zoom: 15.0,
                  markers: gyms.map((gym) {
                    return Marker(
                      point: LatLng(gym.lat, gym.lng),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GymDetailScreen(gym: gym),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.place,
                          size: 40,
                          color: red,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(child: GymSlider(gyms: gyms)),
            ],
          );
  }
}
