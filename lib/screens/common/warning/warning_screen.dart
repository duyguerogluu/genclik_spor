import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class WarningsScreen extends ConsumerWidget {
  const WarningsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, String>> warnings = [
      {
        'title': 'Salon Bakımda',
        'description':
            'Nevin Yanıt Spor Kompleksi 25-28 Mart tarihleri arasında bakıma alınacaktır.'
      },
      {
        'title': 'Etkinlik Erteleme',
        'description':
            'Bu hafta yapılması planlanan futbol turnuvası hava şartları nedeniyle ertelendi.'
      },
      {
        'title': 'Kayıt Yenileme',
        'description':
            '2025 sezonu için kayıt yenileme işlemleri 1 Nisan’da başlayacaktır.'
      },
    ];

    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: customAppBar('Duyurular'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: warnings.length,
        itemBuilder: (context, index) {
          final warning = warnings[index];
          return Card(
            color: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    warning['title'] ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: darkblue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    warning['description'] ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
