import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';

class NewsSlider extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      "image": "https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-23-at-180129.jpg",
      "title": "Gençlik Spor Bakanlığı yeni projelerini duyurdu!",
      "content": "Gençlik Spor Bakanlığı 2025 yılı için birçok yeni proje başlatıyor. Bu projeler arasında..."
    },
    {
      "image": "https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-15-at-123715.jpg",
      "title": "Sporcular için özel eğitim programı başlıyor!",
      "content": "Genç sporcular için hazırlanan yeni eğitim programı Nisan ayında başlayacak. Programın amacı..."
    },
    {
      "image": "https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-12-at-202523.jpg",
      "title": "Tesis başvuruları için son gün 30 Mart!",
      "content": "Spor tesislerinden yararlanmak isteyenler için başvurular 30 Mart'ta sona eriyor. Başvuru yapmak için..."
    },
    {
      "image": "https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-11-at-103405.jpg",
      "title": "Antrenman programlarına katılım zorunludur.",
      "content": "Antrenman programlarına katılım artık zorunlu hale getirildi. Sporcuların disiplinli bir çalışma ortamı..."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, 
      child: PageView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];

          return GestureDetector(
            onTap: () { },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(news["image"]!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding:const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: blacko,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      news["title"]!,
                      style:const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
