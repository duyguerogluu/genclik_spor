import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/coachs/coach_detail_screen.dart';
import 'package:genclik_spor/utils/colors.dart';

GestureDetector coachCard(
    BuildContext context, String name, String branch, String gym) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoachDetailScreen(
            name: name,
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh7-m2anFLaH9UxDgrlvlXUwpds79K10S-IQ&s",
            branch: branch,
            experience: 5,
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Etiam non.",
            phoneNumber: "+905555555555",
          ),
        ),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: white,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh7-m2anFLaH9UxDgrlvlXUwpds79K10S-IQ&s"),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  gym,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  branch,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
