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
        return 'Profesyonel Sporcu';
      case SportType.basketball:
        return 'Amatör Sporcu';
      case SportType.taekwondo:
        return 'Gönüllü Sporcu';
    }
  }
}

class CustomDropdown extends StatelessWidget {
  final ValueNotifier<SportType?> controller;
  final String label;
  

  const CustomDropdown({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SportType?>(
      valueListenable: controller,
      builder: (context, selectedSport, _) {
        return DropdownButtonFormField<SportType>(
          value: selectedSport,
          onChanged: (value) {
            controller.value = value;
          },
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          items: SportType.values.map((sport) {
            return DropdownMenuItem(
              value: sport,
              child: Text(sport.displayName),
            );
          }).toList(),
        );
      },
    );
  }
}
