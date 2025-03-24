import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class TrainingDetailScreen extends StatelessWidget {
  final Map<String, String> training;

  const TrainingDetailScreen({super.key, required this.training});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: AppBar(
        title: const Text('Antrenman Detayı'),
        backgroundColor: darkblue,
        foregroundColor: white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  training['branch'] ?? 'Branş Bilgisi Yok',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _detailRow(Icons.calendar_today, 'Tarih', training['date'] ?? '-'),
                _detailRow(Icons.access_time, 'Saat', training['time'] ?? 'Bilinmiyor'),
                _detailRow(Icons.location_on, 'Salon', training['gym'] ?? 'Belirtilmemiş'),
                _detailRow(Icons.person, 'Antrenör', training['coach'] ?? 'Belirtilmemiş'),
                const SizedBox(height: 16),
                const Text(
                  'Açıklama:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(training['description'] ?? 'Açıklama bulunmamaktadır.', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: darkblue),
          const SizedBox(width: 12),
          Text(
            '$title: ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
