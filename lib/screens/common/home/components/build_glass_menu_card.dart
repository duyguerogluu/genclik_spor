import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/athlete/myapps/my_application_screen.dart';
import 'package:genclik_spor/screens/athlete/performanceanalysis/performance_analysis_screen.dart';
import 'package:genclik_spor/screens/athlete/profilee/athlete_profile_screen.dart';
import 'package:genclik_spor/screens/athlete/training/training_screen.dart';
import 'package:genclik_spor/screens/common/courses/courses_screen.dart';
import 'package:genclik_spor/screens/common/warning/warning_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

Widget buildGlassMenuCard(IconData icon, String title, BuildContext context) {
  String imagePath;

  switch (title) {
    case "Kurslar":
      imagePath = "assets/images/course_bg.png";
      break;
    case "Antrenmanlar":
      imagePath = "assets/images/trainings_bg.png";
      break;
    case "Profilim":
      imagePath = "assets/images/profile_bg.png";
      break;
    case "Performans Analizi":
      imagePath = "assets/images/performance_bg.png";
      break;
    case "Başvurularım":
      imagePath = "assets/images/applications_bg.png";
      break;
    case "Duyurular":
      imagePath = "assets/images/warnings_bg.png";
      break;
    default:
      imagePath = "assets/images/default_bg.png";
  }

  return GestureDetector(
    onTap: () {
      if (title == "Kurslar") {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CoursesScreen()));
      }
      if (title == "Antrenmanlar") {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => TrainingsScreen()));
      }
      if (title == "Profilim") {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => MemberProfileScreen()));
      }
      if (title == "Performans Analizi") {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => PerformanceAnalysisScreen()));
      }
      if (title == "Başvurularım") {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => MyApplicationsScreen()));
      }
      if (title == "Duyurular") {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => WarningsScreen()));
      }
    },
    child: Container(
      width: 60,
      height: 40,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        ),
      ),
    ),
  );
}
