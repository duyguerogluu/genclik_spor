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
    profile.roleController.dispose();
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
                  controller: profile.roleController,
                  label: 'Seviye Seçin',
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
                  hintText: 'endurance',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: profile.speedController,
                  hintText: 'speed',
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
            onPressed: () async {
              debugPrint('Soyad: ${profile.roleController}');
              debugPrint('Soyad: ${profile.ageController.text}');
              debugPrint('Email: ${profile.heightController.text}');
              debugPrint('Telefon: ${profile.weightController.text}');
              debugPrint('sport: ${profile.sportController.text}');
              debugPrint('endurance: ${profile.enduranceController.text}');
              debugPrint('speed: ${profile.speedController.text}');
              debugPrint('flexibility: ${profile.flexibilityController.text}');
              debugPrint('agility: ${profile.agilityController.text}');
              final res =
                  await profile.fetchAthleteProfile(profile.athleteProfile!);
              if (res == true) {
                debugPrint('Profil güncellendi!!!!!!!!!!!');
                Navigator.pop(context);
              } else {
                debugPrint('Profil güncellenemedi!');
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Profil güncellenemedi!")));
              }
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }
}
