import 'package:genclik_spor/models/coach_model.dart';
import 'package:genclik_spor/models/course_model.dart';

class GymModel {
  final String name;
  final String address;
  final List<CoachModel> coaches;
  final List<CourseModel> courses;

  GymModel({
    required this.name,
    required this.address,
    required this.coaches,
    required this.courses,
  });

  factory GymModel.fromJson(Map<String, dynamic> json) {
    return GymModel(
      name: json['name'],
      address: json['address'],
      coaches: (json['coaches'] as List<dynamic>)
          .map((e) => CoachModel.fromJson(e))
          .toList(),
      courses: (json['courses'] as List<dynamic>)
          .map((e) => CourseModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'coaches': coaches.map((e) => e.toJson()).toList(),
      'courses': courses.map((e) => e.toJson()).toList(),
    };
  }
}
