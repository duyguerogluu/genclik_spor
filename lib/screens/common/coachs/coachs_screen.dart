import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/coachs/coach_detail_screen.dart';
import 'package:genclik_spor/screens/common/coachs/components/coach_card.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class CoachsScreen extends ConsumerWidget {
  const CoachsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.isDark ? offdarkblue : white1,
      child: _buildCoachTabContent(context),
    );
  }
}

Widget _buildCoachCard(
    String name, String branch, String gym, BuildContext context) {
  return coachCard(context, name, branch, gym);
}

Widget _buildCoachTabContent(BuildContext context) {
  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Nevin Yanıt',
      'branch': 'Atletizm',
      'gym': 'Nevin Yanıt Spor Komplesksi',
    },
    {
      'name': 'Nevin Yanıt',
      'branch': 'Atletizm',
      'gym': 'Nevin Yanıt Spor Komplesksi',
    },
    {
      'name': 'Nevin Yanıt',
      'branch': 'Atletizm',
      'gym': 'Nevin Yanıt Spor Komplesksi',
    },
    {
      'name': 'Nevin Yanıt',
      'branch': 'Atletizm',
      'gym': 'Nevin Yanıt Spor Komplesksi',
    },
    {
      'name': 'Nevin Yanıt',
      'branch': 'Atletizm',
      'gym': 'Nevin Yanıt Spor Komplesksi',
    },
  ];
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 4,
            mainAxisSpacing: 16,
            childAspectRatio: 3,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return _buildCoachCard(
                item['name'], item['branch'], item['gym'], context);
          },
        ),
      ],
    ),
  );
}
