import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/utils/colors.dart';

class GymsScreen extends ConsumerWidget {
  const GymsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildGymsTabContent(context);
  }

  Widget _buildGymCard(IconData icon, String name, String adress, String city,
      BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(200, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.transparent),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.sports_football,
                    size: 40, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  'Nevin Yanıt Spor Komplesksi',
                  style: TextStyle(
                    color: grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'adress adresss adress adressssss ',
                  style: TextStyle(
                    color: grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'ADANA , Seyhan',
                  style: TextStyle(
                    color: grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGymsTabContent(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.sports_soccer,
        'name': 'Nevin Yanıt Spor Tesisi',
        'adress': 'adress adresss adress adressssss',
        'city': 'ADANA , Seyhan'
      },
      {
        'icon': Icons.sports_soccer,
        'name': 'Nevin Yanıt Spor Tesisi',
        'adress': 'adress adresss adress adressssss',
        'city': 'ADANA , Seyhan'
      },
      {
        'icon': Icons.sports_soccer,
        'name': 'Nevin Yanıt Spor Tesisi',
        'adress': 'adress adresss adress adressssss',
        'city': 'ADANA , Seyhan'
      },
      {
        'icon': Icons.sports_soccer,
        'name': 'Nevin Yanıt Spor Tesisi',
        'adress': 'adress adresss adress adressssss',
        'city': 'ADANA , Seyhan'
      },
      {
        'icon': Icons.sports_soccer,
        'name': 'Nevin Yanıt Spor Tesisi',
        'adress': 'adress adresss adress adressssss',
        'city': 'ADANA , Seyhan'
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
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return _buildGymCard(item['icon'], item['name'], item['adress'],
                  item['city'], context);
            },
          ),
        ],
      ),
    );
  }
}
