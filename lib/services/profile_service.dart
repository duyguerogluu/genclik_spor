import 'dart:convert';
import 'package:genclik_spor/models/athlete_model.dart';
import 'package:genclik_spor/models/member_profile_model.dart';
import 'package:genclik_spor/utils/const.dart';
import 'package:genclik_spor/utils/holder.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  static Future<MemberProfileModel?> getProfile() async {
    final url = Uri.parse("$baseUrl/profile");

    final token = await DataHolder.getToken();

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

  static Future<bool> updateProfile(
    AthleteModel profile,
  ) async {
    final url = Uri.parse("$baseUrl/athlete/profile");

    final token = await DataHolder.getToken();

    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(profile.toMap()),
    );

    return response.statusCode == 200;
  }
}
