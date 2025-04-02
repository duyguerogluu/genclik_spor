import 'dart:convert';
import 'package:genclik_spor/models/login_model.dart';
import 'package:genclik_spor/utils/const.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<LoginModel> loginCall(
    String email,
    String password,
  ) async {
    final url = Uri.parse("$baseUrl/login");
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LoginModel.fromJson(data);
      }
      throw Exception('Giriş başarısız');
    } catch (e) {
      print('Login error: $e');
      throw Exception('Bir hata oluştu: $e');
    }
  }
}
