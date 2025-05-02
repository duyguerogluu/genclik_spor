import 'package:flutter/material.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/screens/common/coachs/components/coach_card.dart';
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
    final isDark = context.isDark;

    final List<Map<String, String>> coaches = [
      {"name": "Ahmet Yılmaz", "branch": "Atletizm"},
      {"name": "Mehmet Demir", "branch": "Yüzme"},
      {"name": "Ayşe Kaya", "branch": "Voleybol"},
    ];

    final List<Map<String, String>> courses = [
      {
        "name": "Basketbol Kursu",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi69qwf8QOi-kpIUVyqgGHom14wa9TsBaEAA&s",
        "desc":
            "Profesyonel antrenörler eşliğinde basketbol teknikleri ve ileri seviye eğitimler.",
        "duration": "3 Ay",
        "capacity": "20",
        "price": "1500₺"
      },
      {
        "name": "Yüzme Kursu",
        "image": "https://example.com/yuzme.jpg",
        "desc": "Tüm yaş grupları için yüzme eğitimi.",
        "duration": "2 Ay",
        "capacity": "15",
        "price": "1200₺"
      },
      {
        "name": "Voleybol Kursu",
        "image": "https://example.com/voleybol.jpg",
        "desc": "Temel ve ileri seviye voleybol eğitimi.",
        "duration": "3 Ay",
        "capacity": "18",
        "price": "1300₺"
      },
    ];

    return Scaffold(
      backgroundColor: isDark ? offdarkblue : white1,
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'gym_image_${gym.lat}${gym.lng}${gym.imgUrl}',
                child: Image.network(
                  gym.imgUrl,
                  width: double.infinity,
                  height: 246,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -36),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDark ? offdarkblue : white1,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          gym.gymName ?? "Spor Salonu",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: darkblue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text("Adres: ${gym.address}",
                            style: TextStyle(fontSize: 15, color: grey)),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkblue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () => _launchMapsUrl(
                              '${gym.gymName!.replaceAll(' ', '+')}+${gym.address}'),
                          icon:
                              const Icon(Icons.directions, color: Colors.white),
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
                        ...coaches.map((coach) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: coachCard(context, coach["name"]!,
                                  coach["branch"]!, gym.gymName!),
                            )),
                        const SizedBox(height: 24),
                        Text("Kurslar",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: darkblue)),
                        const SizedBox(height: 8),
                        ...courses.map((course) => Card(
                              color: isDark ? darkblue.withOpacity(0.1) : white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: ListTile(
                                leading:
                                    Icon(Icons.fitness_center, color: darkblue),
                                title: Text(course["name"]!),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CourseDetailScreen(
                                        courseName: course["name"]!,
                                        imageUrl: course["image"]!,
                                        description: course["desc"]!,
                                        duration: course["duration"]!,
                                        capacity:
                                            int.parse(course["capacity"]!),
                                        price: course["price"]!,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
