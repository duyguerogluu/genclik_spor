import 'dart:convert';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/utils/const.dart';
import 'package:http/http.dart' as http;

class GymService {
  static Future<List<GymModel>> getGyms(String district, String city) async {
    //final url = Uri.parse("$baseUrl/maps/search");

    final response = await http.post(
      Uri.parse("$baseUrl/maps/search"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"ilce": "Şahinbey", "il": "Gaziantep"}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["status"] == "true") {
      print("Response Body: ${response.body}");
      print("Response Status Code signupCall: ${response.statusCode}");
      print("Response Data: ${data['data']}");
      return data['data']
          .map<GymModel>((element) => GymModel.fromJson(element))
          .toList();
    } else {
      return throw Exception('Kayıt başarısız, ${response.body}');
    }
  }
}
