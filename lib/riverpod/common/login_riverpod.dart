import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:genclik_spor/components/loading_popup.dart';
import 'package:genclik_spor/main.dart';
import 'package:genclik_spor/screens/common/home/main_screen.dart';
import 'package:genclik_spor/services/login_service.dart';
import 'package:genclik_spor/utils/holder.dart';

class LoginRiverpod extends ChangeNotifier {
  BuildContext? context;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late var formState = GlobalKey<FormState>();

  Future<bool?> fetchLogin() async {
    debugPrint("fetchLogin çalıştı");
    loadingPopup();

    try {
      var result = await LoginService.loginCall(
        email: email.text,
        password: password.text,
      );

      if (result.status && result.token.isNotEmpty) {
        await DataHolder.putToken(result.token);
        final state = MyApp.navigatorKey.currentState!;
        state.pop();
        state.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const MainScreen(),
          ),
        );

        return true;
      }

      final state = MyApp.navigatorKey.currentState!;

      throw Exception("Geçersiz giriş bilgileri!");
    } catch (e) {
      final state = MyApp.navigatorKey.currentState!;
      state.pop();
      ScaffoldMessenger.of(state.context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll("Exception: ", "")),
          backgroundColor: Colors.red,
        ),
      );

      return false;
    }
  }
   
  


}
