import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget communication(BuildContext context) {
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse('https://www.cimer.gov.tr/'))) {
      throw Exception('Site açılamadı');
    }
  }

  Future<void> _launchUrlFace() async {
    if (!await launchUrl(
      Uri.parse('https://www.facebook.com/gencliksporbak'),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Site açılamadı');
    }
  }

  Future<void> _launchUrlX() async {
    if (!await launchUrl(
      Uri.parse('https://x.com/gencliksporbak'),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Site açılamadı');
    }
  }

  Future<void> _launchUrlInsta() async {
    if (!await launchUrl(
      Uri.parse('https://www.instagram.com/gencliksporbak/'),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Site açılamadı');
    }
  }

  Future<void> _launchUrlYoutube() async {
    if (!await launchUrl(
      Uri.parse('https://www.youtube.com/gencliksporbak'),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Site açılamadı');
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
        onTap: _launchUrl,
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
                  onPressed: _launchUrlFace,
                ),
                IconButton(
                  icon: Image.network('https://example.com/twitter.png'),
                  onPressed: _launchUrlX,
                ),
                IconButton(
                  icon: Image.network('https://example.com/instagram.png'),
                  onPressed: _launchUrlInsta,
                ),
                IconButton(
                  icon: Image.network('https://example.com/youtube.png'),
                  onPressed: _launchUrlYoutube,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
