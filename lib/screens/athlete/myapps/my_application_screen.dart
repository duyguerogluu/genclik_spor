import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final applications = [
      {
        'branch': 'Basketbol',
        'gym': 'Nevin Yanıt Spor Salonu',
        'coach': 'Ahmet Yılmaz',
        'status': 'Onay Bekliyor'
      },
      {
        'branch': 'Voleybol',
        'gym': 'Adnan Menderes Spor Kompleksi',
        'coach': 'Mehmet Demir',
        'status': 'Onaylandı'
      },
    ];

    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: AppBar(
        title: const Text('Başvurularım'),
        backgroundColor: darkblue,
        foregroundColor: white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: applications.length,
        itemBuilder: (context, index) {
          final app = applications[index];
          return Card(
            color: white,
            margin: const EdgeInsets.only(bottom: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(app['branch']!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Salon: ${app['gym']}'),
                  Text('Antrenör: ${app['coach']}'),
                  Text('Durum: ${app['status']}',
                      style: TextStyle(
                        color: app['status'] == 'Onaylandı'
                            ? Colors.green
                            : Colors.orange,
                      )),
                ],
              ),
              leading: Icon(Icons.sports, color: darkblue),
            ),
          );
        },
      ),
    );
  }
}
