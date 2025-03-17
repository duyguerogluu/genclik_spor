import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/components/custom_button.dart';
import 'package:genclik_spor/screens/components/custom_text_field.dart';
import 'package:genclik_spor/screens/common/home/home_screen.dart';
import 'package:genclik_spor/screens/common/login/signup_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _pageLogin = true;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      login.telNo.text = "05554443311";
      login.password.text = "10";
    }
  }

  void _togglePage(bool _switchme) {
    setState(
      () {
        _pageLogin = _switchme;
      },
    );
  }

  bool _ishidden = true;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Login!!!!");
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.isDark ? offdarkblue : white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: deviceHeight * 0.24,
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    semanticsLabel: 'Genclik Spor Bakanligi Photo',
                    color: context.isDark ? white : offdarkblue,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customButton(
                    context: context,
                    onPressed: () {
                      _togglePage(true);
                    },
                    text: 'Giriş',
                    isTransparent: !_pageLogin,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customButton(
                    context: context,
                    onPressed: () {
                      _togglePage(false);
                    },
                    text: 'Kayıt Ol',
                    isTransparent: _pageLogin,
                  ),
                ],
              ),
              _pageLogin
                  ? Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: context.isDark ? offdarkblue : white1,
                              borderRadius: BorderRadius.circular(10),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: offlightblue2,
                              //     blurRadius: 20.0,
                              //     offset: const Offset(0, 0.2),
                              //   )
                              // ],
                            ),
                            child: Column(
                              children: <Widget>[
                                customTextField(
                                  controller: login.telNo,
                                  hintText: "Phone number",
                                  obscureText: false,
                                  onVisibilityToggle: () {},
                                  isDark: context.isDark,
                                ),
                                customTextField(
                                  controller: login.password,
                                  hintText: "Password",
                                  obscureText: _ishidden,
                                  onVisibilityToggle: _toggleVisibility,
                                  isDark: context.isDark,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: customButton(
                              context: context,
                              onPressed: () async {
                                final res = await login.fetchLogin();
                                if (res == true) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                  );
                                } else {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Giriş yapılamadı!")));
                                }
                              },
                              text: 'Giriş Yap',
                              isTransparent: !_pageLogin,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: InkWell(
                              child: Text(
                                'Şifremi Unuttum',
                                style: TextStyle(
                                  color: context.isDark ? white : offdarkblue,
                                  fontSize: 16,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  : SignupScreen()
            ],
          ),
        ),
      ),
    );
  }
}
