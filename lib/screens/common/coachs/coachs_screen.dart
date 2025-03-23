import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/coachs/coach_detail_screen.dart';
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
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoachDetailScreen(
            name: name,
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh7-m2anFLaH9UxDgrlvlXUwpds79K10S-IQ&s",
            branch: branch,
            experience: 5,
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Etiam non.",
            phoneNumber: "+905555555555",
          ),
        ),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: white,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh7-m2anFLaH9UxDgrlvlXUwpds79K10S-IQ&s"),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  gym,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  branch,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
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
