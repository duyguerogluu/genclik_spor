import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/components/custom_text_field.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

//Controllerlar eklenecek !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class SignupScreen extends ConsumerStatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupScreen> {
  TextEditingController telNo = TextEditingController();
  bool _ishidden = true;
  bool isProcessing = false;
  bool _pageLogin = true;

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
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        customTextField(
                          controller: telNo,
                          hintText: "Ad",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        customTextField(
                          controller: telNo,
                          hintText: "Soyad",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        customTextField(
                          controller: telNo,
                          hintText: "Telefon Numarası",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        customTextField(
                          controller: telNo,
                          hintText: "Email",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        customTextField(
                          controller: telNo,
                          hintText: "Şifre",
                          obscureText: false,
                          onVisibilityToggle: () {},
                          isDark: context.isDark,
                        ),
                        //ConfirmPassword(),
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
                        // await model.fetchSignup(context);
                        setState(() {
                          isProcessing = false;
                        });
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _pageLogin
                      ? context.isDark
                          ? offlightblue
                          : offdarkblue
                      : Colors.transparent,
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
                    fontSize: 18,
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
