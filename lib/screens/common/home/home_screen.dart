import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/home/components/custom_app_bar.dart';
import 'package:genclik_spor/screens/common/home/components/custom_bottom_bar.dart';
import 'package:genclik_spor/screens/common/home/components/custom_drawer.dart';
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
                Tab(text: "Antrenörler"),
                Tab(text: "Spor Salonları"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF0F2027),
                          Color(0xFF203A43),
                          Color(0xFF2C5364)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: _buildHomeTabContent(context),
                  ),
                  const Center(child: Text('Antrenörler')),
                  const Center(child: Text('Spor Salonları')),
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
    onTap: () {},
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 40, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildHomeTabContent(BuildContext context) {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.sports_soccer, 'title': 'Spor Branşları'},
    {'icon': Icons.fitness_center, 'title': 'Antrenmanlar'},
    {'icon': Icons.bar_chart, 'title': 'Performans Analizi'},
    {'icon': Icons.person, 'title': 'Profilim'},
    {'icon': Icons.app_registration, 'title': 'Başvurularım'},
    {'icon': Icons.article, 'title': 'Duyurular'},
  ];
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
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
          },
        ),
      ],
    ),
  );
}

Widget _buildWelcomeCard() {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: Colors.blue[800],
    child: const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hoş Geldiniz!",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Spor branşlarına başvurabilir, antrenman programınızı takip edebilir ve performans analizlerinizi görüntüleyebilirsiniz.",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    ),
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
  return GestureDetector(
    onTap: () {
      // if (title == "Spor Branşları") {
      //   Navigator.push(context, MaterialPageRoute(builder: (_) => SportList(someArgument)));
      // }      riverpodu yazınca yönlendiricem
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
  );
}

Widget _buildAnnouncements() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("📢 Duyurular",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              "Yeni sezon kayıtları başladı! Başvuru için Spor Branşları bölümünü ziyaret edin."),
        ),
      ),
    ],
  );
}
