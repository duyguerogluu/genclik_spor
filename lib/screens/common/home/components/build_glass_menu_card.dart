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
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            context.isDark ? purple : white,
            context.isDark ? offdarkblue1 : white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: offlightblue2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  flex: 3,
                  child: Icon(
                    icon,
                    size: 24,
                    color: context.isDark ? white : offdarkblue,
                  )),
              Flexible(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(
                    color: context.isDark ? white : offdarkblue,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
