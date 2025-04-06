import 'package:flutter/material.dart';

enum SportType {
  football,
  basketball,
  taekwondo,
}

extension SportTypeExtension on SportType {
  String get displayName {
    switch (this) {
      case SportType.football:
        return 'Futbol';
      case SportType.basketball:
        return 'Basketbol';
      case SportType.taekwondo:
        return 'Taekwondo';
    }
  }
}

class CustomDropdown extends StatelessWidget {
  final SportType? selectedSport;
  final void Function(SportType?) onChanged;

  const CustomDropdown({
    super.key,
    required this.selectedSport,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<SportType>(
      value: selectedSport,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Spor Dalı Seç Aşko',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      items: SportType.values.map((sport) {
        return DropdownMenuItem(
          value: sport,
          child: Text(sport.displayName),
        );
      }).toList(),
    );
  }
}
