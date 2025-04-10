import 'dart:convert';

import 'package:genclik_spor/models/course_model.dart';
import 'package:genclik_spor/utils/const.dart';
import 'package:http/http.dart' as http;

class CourseService {
  static Future<List<CourseModel>> getCourses() async {
    final url = Uri.parse("$baseUrl/sporcu/courses");

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["status"] == "true") {
      return data['data']
          .map<CourseModel>((element) => CourseModel.fromJson(element))
          .toList();
    } else {
      return throw Exception('Kayıt başarısız, ${response.body}');
    }
  }
}
