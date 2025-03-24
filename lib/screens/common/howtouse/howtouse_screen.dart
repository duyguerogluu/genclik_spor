import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/components/custom_button.dart';
import 'package:genclik_spor/screens/common/login/login_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HowToUseScreen extends StatefulWidget {
  const HowToUseScreen({super.key});

  @override
  State<HowToUseScreen> createState() => _HowToUseScreenState();
}

class _HowToUseScreenState extends State<HowToUseScreen> {
  @override
  void initState() {
    super.initState();
    //_checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HowToUseScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HowToUseScreen()),
      );
    }
  }

  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "🏀 Uygulamaya Hoş Geldiniz!",
      "description": """
        📌 Nasıl Giriş Yapılır?
         ✔ TC Kimlik Numaran ile giriş yaparsın.
         ✔ e-Devlet bağlantısı ile bağlan.
         ✔ Başvuruların ve geçmiş verilerin gör.
         ✔ Kendi spor geçmişini takip edebilirsin.
         ✔ Öğrencini veya çocuğunu takip edebilirsin.
        🔍 Girişten Sonra Neler Yapabilirsin?
         • Spor geçmişini gör
         • Antrenmanlarını takip et
         • Veliysen çocuklarının kayıtlarını kontrol et
       """,
      "image": "assets/images/images.png"
    },
    {
      "title": "⚽️ Kolay Kullanım",
      "description": """
        🏅 Spor Branşlarına Nasıl Başvurulur?
          ✔ Konumunu seç
          ✔ Mahallende açılan kursları gör
          ✔ Branş detaylarını incele 
          ✔ Uygulama içinden başvurunu tamamla
        📅 Antrenman ve Katılım Takibi
        🧠 Deep Sport ile Gelişimini Ölç""",
      "image": "assets/images/images.png"
    },
    {
      "title": "🎾 Hadi Başlayalım!",
      "description": """
        🧑‍🏫 Antrenör Paneli
        🏛 Spor Bakanlığı Paneli
        📎 Ek Modüller:
          ✅ e-Devlet Spor Bilgi Sistemi giriş
          ✅ İllerin antrenör listeleri
          ✅ WADA dosya erişimi
          ✅ Ölçüm ve test alanları
          ✅ Deep Sport'a geçiş modülü
             """,
      "image": "assets/images/images.png"
    }
  ];

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(onboardingData[index]["image"]!),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[index]["title"]!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      onboardingData[index]["description"]!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: context.isDark ? white : offdarkblue,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.all(5),
                width: currentIndex == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: customButton(
              context: context,
              onPressed: currentIndex == onboardingData.length - 1
                  ? _completeOnboarding
                  : () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut),
              text:
                  currentIndex == onboardingData.length - 1 ? "Başla" : "İleri",
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
