import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genclik_spor/models/ehizmet_model.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

final List<EHizmetModel> eHizmetler = [
  EHizmetModel(
    title: "GSB Uygulamaları",
    subtitle: "e-Devlet üzerinden erişim",
    icon: FontAwesomeIcons.appStore,
    url: "https://www.turkiye.gov.tr/gsb-uygulamalari",
  ),
  EHizmetModel(
    title: "Milli Sporcu Belgesi Sorgulama",
    subtitle: "e-Devlet üzerinden erişim",
    icon: FontAwesomeIcons.idCard,
    url:
        "https://www.turkiye.gov.tr/genclik-ve-spor-milli-sporcu-belgesi-sorgulama",
  ),
  EHizmetModel(
    title: "Spor Bilgi Sistemi",
    subtitle: "e-Devlet üzerinden erişim",
    icon: FontAwesomeIcons.idCard,
    url: "https://www.turkiye.gov.tr/gsb-spor-bilgi-sistemi",
  ),
  EHizmetModel(
    title: "Sporcu Lisansı Sorgulama",
    subtitle: "e-Devlet üzerinden erişim",
    icon: FontAwesomeIcons.idCard,
    url: "https://www.turkiye.gov.tr/genclik-ve-spor-sporcu-lisansi-sorgulama",
  ),
  EHizmetModel(
    title: "Talep ve Dilekçe İşlemleri",
    subtitle: "e-Devlet üzerinden erişim",
    icon: FontAwesomeIcons.idCard,
    url:
        "https://www.turkiye.gov.tr/genclik-ve-spor-gsb-talep-dilekce-islemleri",
  ),
];

Widget eHizmetCard(EHizmetModel eHizmet, BuildContext context) {
  return GestureDetector(
    onTap: () async {
      try {
        final uri = Uri.parse(eHizmet.url);
        if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
          throw Exception("Bağlantıya ulaşılamadı");
        }
      } catch (e) {
        print("Error launching URL: $e");
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
      child: Container(
        width: 200,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [white, context.isDark ? darkblue : Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaIcon(eHizmet.icon, size: 28, color: offdarkblue1),
            const SizedBox(height: 12),
            Text(
              eHizmet.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: context.isDark ? white : Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              eHizmet.subtitle,
              style: TextStyle(
                fontSize: 12,
                color: context.isDark ? grey : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget eHizmetList(BuildContext context) {
  return Expanded(
    child: ListView.builder(
      itemCount: eHizmetler.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return eHizmetCard(eHizmetler[index], context);
      },
    ),
  );
}
