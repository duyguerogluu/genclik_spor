import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genclik_spor/screens/common/home/main_screen.dart';
import 'package:genclik_spor/screens/common/howtouse/howtouse_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';
import 'package:genclik_spor/utils/holder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    DataHolder.secureStorage = const FlutterSecureStorage();

    Timer(const Duration(seconds: 3), () async {
      final token = await DataHolder.getToken();

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => token?.isNotEmpty ?? false
              ? const HowToUseScreen()
              : const HowToUseScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.24,
              child: SvgPicture.asset(
                'assets/images/logo1.svg',
                color: context.isDark ? white : offred,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
