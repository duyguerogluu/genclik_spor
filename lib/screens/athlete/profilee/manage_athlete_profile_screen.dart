import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/screens/common/components/custom_dropdown.dart';
import 'package:genclik_spor/screens/common/components/custom_text_field.dart';

class ManageAthleteProfileScreen extends ConsumerStatefulWidget {
  const ManageAthleteProfileScreen({super.key});

  @override
  ConsumerState<ManageAthleteProfileScreen> createState() =>
      _ManageAthleteProfileScreenState();
}

class _ManageAthleteProfileScreenState
    extends ConsumerState<ManageAthleteProfileScreen> {
  SportType? selectedSport;

  @override
  void dispose() {
    profile.ageController.dispose();
    profile.heightController.dispose();
    profile.weightController.dispose();
    profile.sportController.dispose();
    profile.enduranceController.dispose();
    profile.speedController.dispose();
    profile.flexibilityController.dispose();
    profile.agilityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Sporcu Bilgileri Ekle - Güncelle'),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Sporcu Bilgileri Ekle - Güncelle',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CustomDropdown(
                  selectedSport: selectedSport,
                  onChanged: (value) {
                    setState(() {
                      selectedSport = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: profile.ageController,
                  hintText: 'Yaş',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                  numberOnly: true,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: profile.weightController,
                  hintText: 'Kilo',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                  numberOnly: true,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: profile.sportController,
                  hintText: 'Spor Alanın (Örn: Futbol)',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: profile.enduranceController,
                  hintText: 'Spor Alanın (Örn: Futbol)',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: profile.speedController,
                  hintText: 'Spor Alanın (Örn: Futbol)',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: profile.flexibilityController,
                  hintText: 'Esneklik',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: profile.agilityController,
                  hintText: 'Çeviklik',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('Seçilen Spor: $selectedSport');
              debugPrint('Soyad: ${profile.ageController.text}');
              debugPrint('Email: ${profile.heightController.text}');
              debugPrint('Telefon: ${profile.weightController.text}');
              debugPrint('sport: ${profile.sportController.text}');
              debugPrint('endurance: ${profile.enduranceController.text}');
              debugPrint('speed: ${profile.speedController.text}');
              debugPrint('flexibility: ${profile.flexibilityController.text}');
              debugPrint('agility: ${profile.agilityController.text}');
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }
}
