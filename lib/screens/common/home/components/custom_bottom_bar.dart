import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/coach/create_course_screen.dart';
import 'package:genclik_spor/screens/coach/performance_analysis_screen.dart';
import 'package:genclik_spor/screens/common/home/main_screen.dart';
import 'package:genclik_spor/screens/athlete/profilee/athlete_profile_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: context.isDark ? Colors.transparent : Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: context.isDark ? offdarkblue1 : white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: '',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PerformanceAnalysisScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AthleteProfileScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}
