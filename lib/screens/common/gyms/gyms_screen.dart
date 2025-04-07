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
  final List<Map<String, dynamic>> gyms = [
    {
      "imgUrl":
          "https://www.mersinsinemaofisi.com/File_Uploadx/Sayfa/buyuk/mersin-sinema-ofisi-nevin-yanit-atletizm-kompleksi-167363.JPG",
      "gymName": 'Nevin Yanıt Spor Tesisi',
      "address": 'adress adresss adress adressssss',
      "city": 'ADANA , Seyhan',
      "lat": 36.99216948130715,
      "lng": 35.3237324031796,
    },
    {
      "imgUrl":
          "https://www.mersinsinemaofisi.com/File_Uploadx/Sayfa/buyuk/mersin-sinema-ofisi-nevin-yanit-atletizm-kompleksi-167363.JPG",
      "gymName": 'Nevin Yanıt Spor Tesisi',
      "address": 'adress adresss adress adressssss',
      "city": 'ADANA , Seyhan',
      "lat": 37.06406415751307,
      "lng": 37.362847029935075,
    },
    {
      "imgUrl":
          "https://www.mersinsinemaofisi.com/File_Uploadx/Sayfa/buyuk/mersin-sinema-ofisi-nevin-yanit-atletizm-kompleksi-167363.JPG",
      "gymName": 'Nevin Yanıt Spor Tesisi',
      "address": 'adress adresss adress adressssss',
      "city": 'ADANA , Seyhan',
      "lat": 36.98780774252687,
      "lng": 35.32556967162648,
    },
  ];

  GymsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: CustomMap(
            zoom: 15.0,
            markers: gyms.map((gym) {
              return Marker(
                point: latLng.LatLng(gym["lat"], gym["lng"]),
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
