import 'package:flutter/material.dart';
import 'package:genclik_spor/components/loading_popup.dart';

class LoginRiverpod extends ChangeNotifier {
  BuildContext? context;
  TextEditingController telNo = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<bool?> fetchLogin() async {
    debugPrint("fetchLogin çalıştı");
    loadingPopup();
  }
}
