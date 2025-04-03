import 'dart:convert';

import 'package:genclik_spor/models/register_model.dart';
import 'package:genclik_spor/utils/const.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  static Future<RegisterModel> registerCall({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      throw Exception("Şifreler uyuşmuyor!");
    }
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["status"] == "true") {
        return RegisterModel.fromJson(data);
      } else {
        throw Exception('Kayıt başarısız, ${response.body}');
      }
    } catch (e) {
      print('Login error: $e');
      throw Exception('Bir hata oluştu: $e');
    }
  }
}
