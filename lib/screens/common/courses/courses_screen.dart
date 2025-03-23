import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/screens/common/courses/components/course_card.dart';
import 'package:genclik_spor/screens/common/courses/course_detail_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'title': 'Basketbol Başlangıç',
        'description': 'Temel basketbol eğitimi.',
        'gym': 'Nevin Yanıt Spor Salonu',
        'coach': 'Ahmet Yılmaz',
      },
      {
        'title': 'Voleybol İleri Seviye',
        'description': 'Profesyonel voleybol teknikleri.',
        'gym': 'Adnan Menderes Spor Kompleksi',
        'coach': 'Mehmet Demir',
      },
      {
        'title': 'Yüzme Kampı',
        'description': 'Yaz dönemi yüzme kampı.',
        'gym': 'Atatürk Yüzme Kompleksi',
        'coach': 'Ayşe Kaya',
      },
    ];

    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: customAppBar('Kurslar'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return coursesCard(context, course);
        },
      ),
    );
  }

 
}
