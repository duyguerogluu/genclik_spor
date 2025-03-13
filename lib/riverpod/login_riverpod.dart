import 'package:flutter/material.dart';

class LoginRiverpod extends ChangeNotifier {
  BuildContext? context;
  TextEditingController telNo = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<bool?> fetchLogin() async {
    debugPrint("fetchLogin  çalıştı. Tel: ${telNo.text} Pass: ${password.text}");
    return true;
  }
}
