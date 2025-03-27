import 'dart:ui';

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
import 'package:genclik_spor/screens/common/home/components/photo_slider.dart';
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
        _buildWelcomeCard(),
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
            //return _buildWelcomeCard();
          },
        ),
      ],
    ),
  );
}

Widget _buildWelcomeCard() {
  return Column(
    children: [
      Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: PhotoSlider(
              imageUrls: [
                'https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-23-at-180129.jpg',
                'https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-15-at-123715.jpg',
                'https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-12-at-202523.jpg',
                'https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-11-at-103405.jpg',
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: blacko,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Son Dakika: Gençlik Spor Bakanlığı yeni projelerini duyurdu!",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),

      NewsMarquee(
        newsList: [
          'Gençlik Spor Bakanlığı yeni projelerini duyurdu!',
          'Sporcular için özel eğitim programı başlıyor!',
          'Tesis başvuruları için son gün 30 Mart!',
          'Antrenman programlarına katılım zorunludur.',
        ],
      ),
      // Card(
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      //   color: Colors.blue[600],
      //   child: const Padding(
      //     padding: EdgeInsets.all(20.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           "Hoş Geldiniz!",
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 22,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(height: 10),
      //         Text(
      //           "Spor branşlarına başvurabilir, antrenman programınızı takip edebilir ve performans analizlerinizi görüntüleyebilirsiniz.",
      //           style: TextStyle(color: Colors.white70),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    ],
  );
}

Widget _buildMenuGrid(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    children: [
      _buildMenuCard(Icons.sports_soccer, "Spor Branşları", context),
      _buildMenuCard(Icons.fitness_center, "Antrenmanlar", context),
      _buildMenuCard(Icons.bar_chart, "Performans Analizi", context),
      _buildMenuCard(Icons.person, "Profilim", context),
      _buildMenuCard(Icons.app_registration, "Başvurularım", context),
      _buildMenuCard(Icons.article, "Duyurular", context),
    ],
  );
}

Widget _buildMenuCard(IconData icon, String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: GestureDetector(
      onTap: () {
        if (title == "Profilim") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => AthleteProfileScreen()));
        }
        if (title == "Başvurularım") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => MyApplicationsScreen()));
        }
        if (title == "Duyurular") {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => WarningsScreen()));
        }
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.blue[700]),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildAnnouncements() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("📢 Duyurular",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                "Yeni sezon kayıtları başladı! Başvuru için Spor Branşları bölümünü ziyaret edin."),
          ),
        ),
      ],
    ),
  );
}
