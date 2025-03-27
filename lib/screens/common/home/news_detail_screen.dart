import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';

class NewsDetailScreen extends StatelessWidget {
  final Map<String, String> news;

  const NewsDetailScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Haber Detayı'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(news["image"]!),
            ),
            const SizedBox(height: 16),
            Text(
              news["title"]!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              news["content"]!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
