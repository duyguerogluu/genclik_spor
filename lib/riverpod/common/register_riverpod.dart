import 'package:flutter/material.dart';
import 'package:genclik_spor/components/loading_popup.dart';
import 'package:genclik_spor/main.dart';
import 'package:genclik_spor/screens/common/login/login_screen.dart';
import 'package:genclik_spor/services/register_service.dart';

class RegisterRiverpod extends ChangeNotifier {
  BuildContext? context;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  late var formState = GlobalKey<FormState>();

  Future<bool?> fetchRegister() async {
    debugPrint("fetchLogin çalıştı");
    loadingPopup();

    try {
      var result = await RegisterService.registerCall(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        password: password.text,
        confirmPassword: confirmPassword.text,
      );

      if (result.status && result.token.isNotEmpty) {
        final state = MyApp.navigatorKey.currentState!;
        state.pop();
        state.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
        return true;
      }
    } catch (e) {
      final state = MyApp.navigatorKey.currentState;

      if (state != null) {
        state.pop();
        ScaffoldMessenger.of(state.context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll("Exception: ", "")),
            backgroundColor: Colors.red,
          ),
        );
      }

      return false;
    }
    return null;
  }
}
