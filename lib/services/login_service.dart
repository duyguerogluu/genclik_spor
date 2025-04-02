import 'dart:convert';
import 'package:genclik_spor/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static const String baseUrl =
      "https://gncspor.sinbadbilgiteknolojileri.com/api/v1";

  Future<LoginModel> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Giriş başarısız!");
    }
  }
}
