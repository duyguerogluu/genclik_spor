import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/courses/courses_screen.dart';

Widget courseButton(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CoursesScreen()));
    },
    icon: const Icon(Icons.assignment),
    label: const Text("Kursları Görüntüle"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange[800],
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
