import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/coach/create_course_screen.dart';
import 'package:genclik_spor/screens/coach/performance_analysis_screen.dart';
import 'package:genclik_spor/screens/common/home/main_screen.dart';
import 'package:genclik_spor/screens/athlete/profilee/athlete_profile_screen.dart';
import 'package:genclik_spor/screens/common/news/news_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

final List<Map<String, String>> newsList = [
  {
    "image":
        "https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-23-at-180129.jpg",
    "title": "Gençlik Spor Bakanlığı yeni projelerini duyurdu!",
    "content":
        "Gençlik Spor Bakanlığı 2025 yılı için birçok yeni proje başlatıyor. Bu projeler arasında..."
  },
  {
    "image":
        "https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-15-at-123715.jpg",
    "title": "Sporcular için özel eğitim programı başlıyor!",
    "content":
        "Genç sporcular için hazırlanan yeni eğitim programı Nisan ayında başlayacak. Programın amacı..."
  },
  {
    "image":
        "https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-12-at-202523.jpg",
    "title": "Tesis başvuruları için son gün 30 Mart!",
    "content":
        "Spor tesislerinden yararlanmak isteyenler için başvurular 30 Mart'ta sona eriyor. Başvuru yapmak için..."
  },
  {
    "image":
        "https://ankara.gsb.gov.tr/public/Images/GSB/012014/whatsapp-image-2025-03-11-at-103405.jpg",
    "title": "Antrenman programlarına katılım zorunludur.",
    "content":
        "Antrenman programlarına katılım artık zorunlu hale getirildi. Sporcuların disiplinli bir çalışma ortamı..."
  },
];

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: context.isDark ? Colors.transparent : Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: context.isDark ? offdarkblue1 : white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: '',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsScreen(newsList: newsList),

                  ///newlisti sonra homescreendan çekcez!!!!!!!!!!!
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AthleteProfileScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}
