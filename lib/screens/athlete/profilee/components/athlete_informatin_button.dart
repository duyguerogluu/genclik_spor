import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/athlete/profilee/manage_athlete_profile_screen.dart';
import 'package:genclik_spor/utils/colors.dart';

Widget athleteInformationButton(BuildContext context) {
  return Center(
    child: ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ManageAthleteProfileScreen()));
      },
      icon: const Icon(Icons.assignment, color: Colors.white),
      label: const Text("Kursları Görüntüle",
          style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: offlightblue1,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
