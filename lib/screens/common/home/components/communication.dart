import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Widget communication() {
  final Uri facebookUrl = Uri.parse('https://facebook.com');
  final Uri twitterUrl = Uri.parse('https://twitter.com');
  final Uri instagramUrl = Uri.parse('https://instagram.com');
  final Uri youtubeUrl = Uri.parse('https://youtube.com');

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('URL açılamadı: $url');
    }
  }

  return Column(
    children: [
      const Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.place),
              title: Text("Adres",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Text(
                  "Örnek Mahallesi Oruç Reis Caddesi No: 13 Altındağ/Ankara"),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Telefon",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text("444 0 472", style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        child: Card(
          child: Column(
            children: [
              Icon(Icons.book),
              Text("Öneri / Şikayet",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Image.network('https://gsb.gov.tr/dist/images/cimer-logo.svg'),
            ],
          ),
        ),
      ),
      Card(
        child: Column(
          children: [
            Icon(Icons.signal_wifi_connected_no_internet_4),
            Text("Sosyal Medya",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.network('https://example.com/facebook.png'),
                  onPressed: () {
                    _launchUrl(facebookUrl);
                  },
                ),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    onPressed: () {
                      _launchUrl(twitterUrl);
                    }),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.xTwitter),
                  onPressed: () {
                    _launchUrl(instagramUrl);
                  },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.youtube),
                  onPressed: () {
                    _launchUrl(youtubeUrl);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
