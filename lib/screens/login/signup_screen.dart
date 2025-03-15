import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

//Controllerlar eklenecek !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class SignupScreen extends ConsumerStatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupScreen> {
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
          children: <Widget>[
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
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 253, 210, 92)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ad",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 253, 210, 92)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Soyad",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 253, 210, 92)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Telefon Numarası",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 253, 210, 92)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email Adres",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),

                        Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              cursorColor: Colors.purpleAccent,
                              obscureText: _ishidden ? true : false,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 253, 210, 92)),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(_ishidden
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: _toggleVisibility,
                                ),
                                border: InputBorder.none,
                                hintText: "Şifre",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            )),
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
                    color: _pageLogin
                        ? Colors.white
                        : Color.fromARGB(255, 217, 217, 217),
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
