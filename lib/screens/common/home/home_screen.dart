import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/common/gyms/components/gym_slider.dart';
import 'package:genclik_spor/screens/common/home/components/build_glass_menu_card.dart';
import 'package:genclik_spor/screens/common/home/components/communication.dart';
import 'package:genclik_spor/screens/common/home/components/ehizmet.dart'
    show eHizmetCard, eHizmetList, eHizmetler;
import 'package:genclik_spor/screens/common/home/components/news_marquee.dart';
import 'package:genclik_spor/screens/common/news/news_slider.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';
import 'package:genclik_spor/screens/common/home/components/history.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.isDark ? offdarkblue : white,
      child: _buildHomeTabContent(context, ref),
    );
  }
}

Widget _buildHomeTabContent(BuildContext context, WidgetRef ref) {
  final gyms = ref.watch(gymRiverpod).gyms;
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
        NewsMarquee(
          newsList: [
            'Gençlik Spor Bakanlığı yeni projelerini duyurdu!',
            'Sporcular için özel eğitim programı başlıyor!',
            'Tesis başvuruları için son gün 30 Mart!',
            'Antrenman programlarına katılım zorunludur.',
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: false,
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return buildGlassMenuCard(item['icon'], item['title'], context);
            },
          ),
        ),
        GymSlider(gyms: gyms),
        SizedBox(
          height: 180,
          child: ListView.builder(
            shrinkWrap: false,
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: eHizmetler.length,
            itemBuilder: (context, index) {
              final item = eHizmetler[index];
              return eHizmetCard(item, context);
            },
          ),
        ),
        history(context),
        communication(context),
      ],
    ),
  );
}
