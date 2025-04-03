import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/common/components/custom_button.dart';
import 'package:genclik_spor/screens/common/components/custom_text_field.dart';
import 'package:genclik_spor/screens/common/login/login_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupScreen> {
  bool _ishidden = true;
  bool isProcessing = false;
  bool _pageLogin = true;
  bool isTransparent = false;

  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  DateTime? birthDate;
  String? birthDateInString;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Register!!!!");
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: context.isDark ? offdarkblue : white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: offlightblue2,
                    blurRadius: 20.0,
                    offset: const Offset(0, 0.2),
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: context.isDark ? offdarkblue : white,
                    ),
                    child: Column(
                      children: <Widget>[
                        customTextField(
                          controller: register.firstName,
                          hintText: "Ad",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        customTextField(
                          controller: register.lastName,
                          hintText: "Soyad",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        customTextField(
                          controller: register.email,
                          hintText: "Email",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        customTextField(
                          controller: register.password,
                          hintText: "password",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        customTextField(
                          controller: register.confirmPassword,
                          hintText: "Password confirm",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: isProcessing
                    ? null
                    : () async {
                        setState(() {
                          isProcessing = true;
                        });
                        bool? isRegistered = await register.fetchRegister();
                        setState(() {
                          isProcessing = false;
                        });

                        if (isRegistered ?? false) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Kayıt başarısız oldu'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isTransparent
                      ? Colors.transparent
                      : context.isDark
                          ? offlightblue
                          : offdarkblue,
                  foregroundColor: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Kaydol',
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        _pageLogin ? white : Color.fromARGB(255, 217, 217, 217),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
