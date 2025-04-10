import 'package:flutter/material.dart';
import 'package:genclik_spor/models/course_model.dart';
import 'package:genclik_spor/screens/common/courses/course_detail_screen.dart';

GestureDetector coursesCard(BuildContext context, CourseModel course) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CourseDetailScreen(
            courseName: course.title,
            imageUrl: course.imageUrl,
            description: course.description,
            duration: course.duration,
            capacity: 20,
            price: '100 TL',
          ),
        ),
      );
    },
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(course.description),
            const SizedBox(height: 8),
            Text('Antrenör: ${course.coachName}',
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    ),
  );
}
