import 'package:flutter/material.dart';
import 'package:genclik_spor/models/course_model.dart';
import 'package:genclik_spor/services/course_service.dart';

class CourseRiverpod extends ChangeNotifier {
  List<CourseModel> courses = [];
  bool isLoading = false;

  Future<void> fetchCourses() async {
    debugPrint("fetchCourses() build çalıştı!!!!!!!!!!");
    if (isLoading) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      courses = await CourseService.getCourses();
    } catch (e) {
      debugPrint("Course fetch error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
