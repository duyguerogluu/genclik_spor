import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/utils/const.dart';

class GymService {
  static Future<List<GymModel>> getGyms(String district, String city) async {
    try {
      final uri = Uri.parse("$baseUrl/maps/search");
      final response = await http.post(
        uri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"ilce": district, "il": city}),
      );

      if (response.statusCode != 200) {
        debugPrint("GymService: HTTP ${response.statusCode}");
        return [];
      }

      final data = jsonDecode(response.body);
      if (data["status"] != "true") {
        debugPrint("GymService: API hata, message=${data['message']}");
        return [];
      }

      final List list = data['data'] as List;
      return list
          .map((e) => GymModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      debugPrint("GymService.getGyms error: $e\n$st");
      return [];
    }
  }
}
