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
                  _buildHomeTabContent(context),
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

Widget _buildHomeTabContent(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: _buildWelcomeCard()),
      //Expanded(child: _buildMenuGrid(context)),
      GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), 
        children: [
          _buildMenuCard(Icons.sports_soccer, "Spor Branşları", context),
          _buildMenuCard(Icons.fitness_center, "Antrenmanlar", context),
          _buildMenuCard(Icons.bar_chart, "Performans Analizi", context),
          _buildMenuCard(Icons.person, "Profilim", context),
          _buildMenuCard(Icons.app_registration, "Başvurularım", context),
          _buildMenuCard(Icons.article, "Duyurular", context),
        ],
      ),
      // _buildAnnouncements(),
    ],
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
