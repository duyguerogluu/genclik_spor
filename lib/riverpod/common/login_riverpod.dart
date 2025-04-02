import 'package:flutter/material.dart';
import 'package:genclik_spor/components/loading_popup.dart';
import 'package:genclik_spor/main.dart';
import 'package:genclik_spor/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRiverpod extends ChangeNotifier {
  BuildContext? context;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<bool?> fetchLogin() async {
    debugPrint("fetchLogin çalıştı");
    loadingPopup();
  }
}
