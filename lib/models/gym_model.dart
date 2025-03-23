import 'package:genclik_spor/models/coach_model.dart';
import 'package:genclik_spor/models/course_model.dart';

class GymModel {
  final String name;
  final String imageUrl;
  final String address;
  final String city;
  final List<CoachModel> coaches;
  final List<CourseModel> courses;

  GymModel({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.city,
    required this.coaches,
    required this.courses,
  });

  factory GymModel.fromJson(Map<String, dynamic> json) => GymModel(
        name: json['name'],
        imageUrl: json['imageUrl'],
        address: json['address'],
        city: json['city'],
        coaches:
            (json['coaches'] as List).map((e) => CoachModel.fromJson(e)).toList(),
        courses:
            (json['courses'] as List).map((e) => CourseModel.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'address': address,
        'city': city,
        'coaches': coaches.map((e) => e.toJson()).toList(),
        'courses': courses.map((e) => e.toJson()).toList(),
      };
}
