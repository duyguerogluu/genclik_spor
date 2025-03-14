import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/login/login_screen.dart';
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
    // _checkFirstTime();
  }

/*
  Future<void> _checkFirstTime() async {
    // final prefs = await SharedPreferences.getInstance();
    // final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    // if (isFirstTime) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HowToUseScreen()),
    //   );
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HowToUseScreen()),
    //   );
    // }
  }
  */

  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Hoş Geldiniz!",
      "description": "Uygulamamızı keşfetmeye hazır olun!",
      "image": ""
    },
    {
      "title": "Kolay Kullanım",
      "description": "Basit ve sezgisel bir deneyim sunuyoruz.",
      "image": ""
    },
    {
      "title": "Hadi Başlayalım!",
      "description": "Uygulamayı şimdi keşfetmeye başlayın!",
      "image": ""
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
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
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
            child: ElevatedButton(
              onPressed: currentIndex == onboardingData.length - 1
                  ? _completeOnboarding
                  : () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut),
              child: Text(currentIndex == onboardingData.length - 1
                  ? "Başla"
                  : "İleri"),
            ),
          ),
        ],
      ),
    );
  }
}
