import 'dart:convert';
import 'package:genclik_spor/models/member_profile_model.dart';
import 'package:genclik_spor/utils/const.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  static Future<MemberProfileModel?> getProfile(String token) async {
    final url = Uri.parse("$baseUrl/profile");

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MemberProfileModel.fromJson(data['member']);
    } else {
      return null;
    }
  }
}
