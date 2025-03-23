import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class MyApplicationsScreen extends StatefulWidget {
  const MyApplicationsScreen({super.key});

  @override
  State<MyApplicationsScreen> createState() => _MyApplicationsScreenState();
}

class _MyApplicationsScreenState extends State<MyApplicationsScreen> {
  final currentApplications = [
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

  final pastApplications = [
    {
      'branch': 'Yüzme',
      'gym': 'Atatürk Yüzme Kompleksi',
      'coach': 'Ayşe Kaya',
      'status': 'Tamamlandı'
    },
    {
      'branch': 'Tenis',
      'gym': 'İzmir Spor Kulübü',
      'coach': 'Ali Çelik',
      'status': 'Tamamlandı'
    },
  ];

  bool showPastApplications = false;
  bool isLoading = false;

  void _togglePastApplications() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      showPastApplications = true;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: customAppBar('Başvurularım'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...currentApplications.map((app) => _buildCard(app)),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkblue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: showPastApplications ? null : _togglePastApplications,
            child: const Text(
              "Geçmiş Başvuruları Gör",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          if (isLoading)
            const Center(child: CupertinoActivityIndicator(radius: 18)),
          if (showPastApplications)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Geçmiş Başvurular",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: darkblue),
                ),
                const SizedBox(height: 12),
                ...pastApplications.map((app) => _buildCard(app)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildCard(Map<String, String> app) {
    return Card(
      elevation: 0,
      color: white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                  color: app['status'] == 'Onaylandı' ||
                          app['status'] == 'Tamamlandı'
                      ? Colors.green
                      : Colors.orange,
                )),
          ],
        ),
        leading: Icon(Icons.sports, color: darkblue),
      ),
    );
  }
}
