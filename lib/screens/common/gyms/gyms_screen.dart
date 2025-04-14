import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/screens/common/components/custom_map.dart';
import 'package:genclik_spor/screens/common/gyms/components/city_district_dropdown.dart';
import 'package:genclik_spor/screens/common/gyms/components/gym_slider.dart';
import 'package:genclik_spor/screens/common/gyms/components/gym_slider2.dart';
import 'package:genclik_spor/screens/common/gyms/gym_detail_screen.dart';
import 'package:genclik_spor/services/gym_service.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:latlong2/latlong.dart';

class GymsScreen extends ConsumerStatefulWidget {
  const GymsScreen({super.key});

  @override
  _GymsScreenState createState() => _GymsScreenState();
}

class _GymsScreenState extends ConsumerState<GymsScreen> {
  Future<void> fetchGyms(
      {required String city, required String district}) async {
    try {
      final fetchedGyms = await GymService.getGyms(district, city);
      if (fetchedGyms.isEmpty) {
        debugPrint('No gyms found');
        return;
      }
      setState(() {
        gyms = fetchedGyms;
      });
    } catch (e) {
      debugPrint('Error fetching gyms: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gymRiverpod.notifier).fetchGyms();
    });
    fetchGyms(city: "Gaziantep", district: "Şahinbey");
  }

  List<GymModel> gyms = [];
  final userMarker = const Marker(
    point: LatLng(37.06406415751307, 37.362847029935075),
    child: Icon(
      Icons.place,
      size: 50,
      color: Colors.blue,
    ),
  );

  // Future<void> fetchGyms() async {
  //   try {
  //     final fetchedGyms = await GymService.getGyms('Şahinbey', 'Gaziantep');
  //     if (fetchedGyms.isEmpty) {
  //       debugPrint('No gyms found');
  //       return;
  //     }
  //     setState(() {
  //       gyms = fetchedGyms;
  //     });
  //   } catch (e) {
  //     debugPrint('Error fetching companies: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //final gyms = ref.watch(gymRiverpod).gyms;
    final allGyms = gyms;

    final filteredGyms = gyms.where((gym) {
      final lat = gym.lat;
      final lng = gym.lng;
      return lat != null && lng != null && lat != 0 && lng != 0;
    }).toList();

    return gyms.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 300,
                  child: CustomMap(
                    zoom: 15.0,
                    markers: [
                      userMarker,
                      ...gyms.map((gym) {
                        return Marker(
                          point: LatLng(gym.lat, gym.lng),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GymDetailScreen(gym: gym),
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
                      })
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // GymSlider(gyms: gyms),
                CityDistrictDropdown(
                  onCityDistrictSelected: (city, district) {
                    fetchGyms(city: city, district: district);
                  },
                ),
                const SizedBox(height: 20),
                GymSlider2(gyms: filteredGyms),
              ],
            ),
          );
  }
}
