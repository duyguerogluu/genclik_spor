import 'dart:convert';

import 'package:genclik_spor/models/register_model.dart';
import 'package:genclik_spor/utils/const.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  static Future<RegisterModel> registerCall({
    required String first_name,
    required String last_name,
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'first_name': first_name,
          'last_name': last_name,
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation,
        }),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return RegisterModel.fromJson(data);
      }
      throw Exception('Kayıt BAşarısız');
    } catch (e) {
      print('Login error: $e');
      throw Exception('Bir hata oluştu: $e');
    }
  }
}
