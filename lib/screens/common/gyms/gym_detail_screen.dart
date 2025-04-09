import 'package:flutter/material.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/screens/common/coachs/components/coach_card.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/screens/common/courses/course_detail_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class GymDetailScreen extends StatelessWidget {
  final GymModel gym;

  const GymDetailScreen({
    super.key,
    required this.gym,
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
      appBar: customAppBar(gym.name!),
      backgroundColor: context.isDark ? offdarkblue : white1,
      body: ListView(
        children: [
          Image.network(
            gym.photoUrl ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtjoMkGYtYSrHSgf55BCUmoTr9g89xYMXrpQ&s',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Adres: ${gym.address}",
              style: TextStyle(fontSize: 16, color: grey),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: offdarkblue),
              onPressed: () => _launchMapsUrl(
                  '${gym.name!.replaceAll(' ', '+')}+${gym.address}'),
              icon: const Icon(Icons.directions, color: Colors.white),
              label: const Text("Yol Tarifi Al",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Antrenörler",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkblue)),
          ),
          const SizedBox(height: 8),
          ...coaches.map((coach) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                child: coachCard(context, 'coachname', "Atletizm", 'gymName'),
              )),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Text("Kurslar",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkblue)),
          ),
          const SizedBox(height: 8),
          ...courses.map((course) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailScreen(
                          courseName: "Basketbol Kursu",
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi69qwf8QOi-kpIUVyqgGHom14wa9TsBaEAA&s",
                          description:
                              "Profesyonel antrenörler eşliğinde basketbol temel teknikleri ve ileri seviye eğitimler.",
                          duration: "3 Ay",
                          capacity: 20,
                          price: "1500₺",
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: const Text("Basketbol Kursu"),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
