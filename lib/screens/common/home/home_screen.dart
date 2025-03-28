import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/athlete/myapps/my_application_screen.dart';
import 'package:genclik_spor/screens/athlete/performanceanalysis/performance_analysis_screen.dart';
import 'package:genclik_spor/screens/athlete/profilee/athlete_profile_screen.dart';
import 'package:genclik_spor/screens/athlete/training/training_screen.dart';
import 'package:genclik_spor/screens/common/coachs/coachs_screen.dart';
import 'package:genclik_spor/screens/common/courses/courses_screen.dart';
import 'package:genclik_spor/screens/common/gyms/gyms_screen.dart';
import 'package:genclik_spor/screens/common/home/components/custom_app_bar.dart';
import 'package:genclik_spor/screens/common/home/components/custom_bottom_bar.dart';
import 'package:genclik_spor/screens/common/home/components/custom_drawer.dart';
import 'package:genclik_spor/screens/common/home/components/news_marquee.dart';
import 'package:genclik_spor/screens/common/home/components/news_slider.dart';
import 'package:genclik_spor/screens/common/warning/warning_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: context.isDark ? offdarkblue : white,
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        bottomNavigationBar: CustomBottomBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              labelColor: context.isDark ? white : offdarkblue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: context.isDark ? white : offdarkblue,
              isScrollable: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              tabAlignment: TabAlignment.start,
              dividerHeight: 0,
              indicatorWeight: 0.2,
              tabs: const [
                Tab(text: "Anasayfa"),
                Tab(text: "Spor Salonları"),
                Tab(text: "Antrenörler"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: context.isDark ? offdarkblue : white1,
                    child: _buildHomeTabContent(context),
                  ),
                  const GymsScreen(),
                  const CoachsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildGlassMenuCard(IconData icon, String title, BuildContext context) {
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
            context, MaterialPageRoute(builder: (_) => AthleteProfileScreen()));
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
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromARGB(200, 255, 255, 255),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: darkblue),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildHomeTabContent(BuildContext context) {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.sports_soccer, 'title': 'Kurslar'},
    {'icon': Icons.fitness_center, 'title': 'Antrenmanlar'},
    {'icon': Icons.bar_chart, 'title': 'Performans Analizi'},
    {'icon': Icons.person, 'title': 'Profilim'},
    {'icon': Icons.app_registration, 'title': 'Başvurularım'},
    {'icon': Icons.article, 'title': 'Duyurular'},
  ];
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NewsSlider(),
        _annonces(),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return _buildGlassMenuCard(item['icon'], item['title'], context);
          },
        ),
      ],
    ),
  );
}

Widget _annonces() {
  return const NewsMarquee(
    newsList: [
      'Gençlik Spor Bakanlığı yeni projelerini duyurdu!',
      'Sporcular için özel eğitim programı başlıyor!',
      'Tesis başvuruları için son gün 30 Mart!',
      'Antrenman programlarına katılım zorunludur.',
    ],
  );
}

