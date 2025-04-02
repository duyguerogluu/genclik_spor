import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/screens/common/news/news_detail_screen.dart';
import 'package:genclik_spor/utils/colors.dart';

class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> newsList;

  const NewsScreen({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Haberler'),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding:const EdgeInsets.all(10),
              leading: Image.network(news['image']!, width: 80, fit: BoxFit.cover),
              title: Text(
                news['title']!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                news['content']!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailScreen(news: news),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
