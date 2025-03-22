import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class GymsScreen extends ConsumerWidget {
  const GymsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.isDark ? offdarkblue : white1,
      child: _buildGymsTabContent(context),
    );
  }

  Widget _buildGymCard(IconData icon, String name, String adress, String city,
      BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 3,
                child: Image.network(
                    "https://www.mersinsinemaofisi.com/File_Uploadx/Sayfa/buyuk/mersin-sinema-ofisi-nevin-yanit-atletizm-kompleksi-167363.JPG"),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  'Nevin Yanıt Spor Komplesksi',
                  style: TextStyle(
                    color: grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  'adress adresss adress adressssss ',
                  style: TextStyle(
                    color: grey,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  'ADANA , Seyhan',
                  style: TextStyle(
                    color: grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
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
