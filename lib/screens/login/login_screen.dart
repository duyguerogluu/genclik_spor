import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/home/home_screen.dart';

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: deviceHeight * 0.18,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _togglePage(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _pageLogin
                          ? const Color.fromARGB(255, 253, 210, 92)
                          : Colors.transparent,
                      foregroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Giriş',
                      style: TextStyle(
                        fontSize: 18,
                        color: _pageLogin
                            ? Colors.white
                            : const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _togglePage(false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _pageLogin
                          ? Colors.transparent
                          : const Color.fromARGB(255, 253, 210, 92),
                      foregroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Kayıt Ol',
                      style: TextStyle(
                          fontSize: 18,
                          color: _pageLogin
                              ? const Color.fromARGB(255, 217, 217, 217)
                              : Colors.white),
                    ),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10),
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: login.telNo,
                                    cursorColor: Colors.purpleAccent,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 253, 210, 92)),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Phone number",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                    ),
                                  ),
                                ),

                                //password gircem
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: login.password,
                                    cursorColor: Colors.purpleAccent,
                                    obscureText: _ishidden ? true : false,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 253, 210, 92)),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(_ishidden
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: _toggleVisibility,
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ElevatedButton(
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
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _pageLogin
                                    ? const Color.fromARGB(255, 253, 210, 92)
                                    : Colors.transparent,
                                foregroundColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Giriş Yap',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: _pageLogin
                                      ? Colors.white
                                      : Color.fromARGB(255, 217, 217, 217),
                                ),
                              ),
                            ),
                          ),

                          //Şifremi Unuttum
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: InkWell(
                              child: const Text(
                                'Şifremi Unuttum',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 253, 210, 92),
                                  fontSize: 16,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  : LoginScreen() //!!!!!!!!!!!!!!!!!!!!!! singupp a yönlendiricem
            ],
          ),
        ),
      ),
    );
  }
}
