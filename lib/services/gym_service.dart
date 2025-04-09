import 'dart:convert';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/utils/const.dart';
import 'package:http/http.dart' as http;

class GymService {
  static Future<List<GymModel>> getGyms({
    required String city,
    required String district,
  }) async {
    final url = Uri.parse("$baseUrl/maps/search");

    final response = await http.post(
      url,
      body: jsonEncode({
        'city': city,
        'district': district,
      }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["status"] == "true") {
      return data.map((gymJson) => GymModel.fromJson(gymJson)).toList();
    } else {
      return throw Exception('Kayıt başarısız, ${response.body}');
    }
  }
}
