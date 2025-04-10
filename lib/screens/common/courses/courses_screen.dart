import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/screens/common/courses/components/course_card.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("CoursesScreen build çalıştı!!!!!!!!!!");
    final courses = ref.watch(courseRiverpod).courses;

    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: customAppBar('Kurslar'),
      body: courses.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return coursesCard(context, course.toJson());
              },
            ),
    );
  }
}
