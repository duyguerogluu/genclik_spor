import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

Widget communication(BuildContext context) {
  final Uri facebookUrl = Uri.parse('https://facebook.com');
  final Uri twitterUrl = Uri.parse('https://twitter.com');
  final Uri instagramUrl = Uri.parse('https://instagram.com');
  final Uri youtubeUrl = Uri.parse('https://youtube.com');
  final Uri cimerUrl = Uri.parse('https://www.cimer.gov.tr');

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('URL açılamadı: $url');
    }
  }

  final Uri phoneNumber = Uri(scheme: 'tel', path: '4440472');

  Future<void> _makePhoneCall() async {
    if (await canLaunchUrl(phoneNumber)) {
      await launchUrl(phoneNumber);
    } else {
      throw 'Arama yapılamıyor: $phoneNumber';
    }
  }

  return Column(
    children: [
      Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              context.isDark ? purple : white,
              context.isDark ? offdarkblue1 : white
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: offlightblue2,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.transparent,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.place, color: offdarkblue),
                title: Text("Adres",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: offdarkblue1)),
                subtitle: Text(
                    "Örnek Mahallesi Oruç Reis Caddesi No: 13 Altındağ/Ankara"),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: _makePhoneCall,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                context.isDark ? purple : white,
                context.isDark ? offdarkblue1 : white
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: offlightblue2,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.transparent,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone, color: offdarkblue),
                  title: Text("Telefon",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: offdarkblue1)),
                  subtitle: Text("444 0 472", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          _launchUrl(cimerUrl);
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                context.isDark ? purple : white,
                context.isDark ? offdarkblue1 : white
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: offlightblue2,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.transparent,
            child: Column(
              children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.pen, color: offdarkblue),
                  title: Text("Öneri / Şikayet",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: offdarkblue1)),
                  subtitle:
                      Text("cimer.gov.tr", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              context.isDark ? purple : white,
              context.isDark ? offdarkblue1 : white
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: offlightblue2,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text("Sosyal Medya",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: offdarkblue1)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          _launchUrl(facebookUrl);
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.xTwitter,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            _launchUrl(twitterUrl);
                          }),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                          _launchUrl(instagramUrl);
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.youtube,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          _launchUrl(youtubeUrl);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
