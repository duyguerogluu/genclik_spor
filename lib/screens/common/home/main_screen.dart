import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/coachs/coachs_screen.dart';
import 'package:genclik_spor/screens/common/home/components/custom_app_bar.dart';
import 'package:genclik_spor/screens/common/components/custom_bottom_bar.dart';
import 'package:genclik_spor/screens/common/home/components/custom_drawer.dart';
import 'package:genclik_spor/screens/common/home/home_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

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
                //Tab(text: "Spor Salonları"),
                Tab(text: "Antrenörler"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const HomeScreen(),
                  //GymsScreen(),
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
