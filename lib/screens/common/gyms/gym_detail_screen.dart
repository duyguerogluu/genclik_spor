import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class GymDetailScreen extends StatelessWidget {
  final String imgUrl;
  final String gymName;
  final String address;
  final String city;

  const GymDetailScreen({
    super.key,
    required this.imgUrl,
    required this.gymName,
    required this.address,
    required this.city,
  });

  void _launchMapsUrl(String query) async {
    final url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Harita açılamadı.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> coaches = ["Ahmet Yılmaz", "Mehmet Demir", "Ayşe Kaya"];
    final List<String> courses = [
      "Basketbol Kursu",
      "Yüzme Kursu",
      "Voleybol Kursu"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          gymName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: offdarkblue,
      ),
      backgroundColor: context.isDark ? offdarkblue : white1,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "Adres: $address\n$city",
              style: TextStyle(fontSize: 16, color: grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: darkblue),
              onPressed: () => _launchMapsUrl('$gymName $city'),
              icon: const Icon(Icons.directions, color: Colors.white),
              label: const Text("Yol Tarifi Al",
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 24),
            Text("Antrenörler",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkblue)),
            const SizedBox(height: 8),
            ...coaches.map((coach) => ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(coach),
                )),
            const SizedBox(height: 24),
            Text("Kurslar",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkblue)),
            const SizedBox(height: 8),
            ...courses.map((course) => ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: Text(course),
                )),
          ],
        ),
      ),
    );
  }
}
