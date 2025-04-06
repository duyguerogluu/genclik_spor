import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final sportController = TextEditingController();
  final enduranceController = TextEditingController();
  final speedController = TextEditingController();
  final flexibilityController = TextEditingController();
  final agilityController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    sportController.dispose();
    enduranceController.dispose();
    speedController.dispose();
    flexibilityController.dispose();
    agilityController.dispose();
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
                  controller: ageController,
                  hintText: 'Yaş',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                  numberOnly: true,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: weightController,
                  hintText: 'Kilo',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                  numberOnly: true,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: sportController,
                  hintText: 'Spor Alanın (Örn: Futbol)',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: enduranceController,
                  hintText: 'Spor Alanın (Örn: Futbol)',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: speedController,
                  hintText: 'Spor Alanın (Örn: Futbol)',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: flexibilityController,
                  hintText: 'Esneklik',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: agilityController,
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
              debugPrint('Soyad: ${ageController.text}');
              debugPrint('Email: ${heightController.text}');
              debugPrint('Telefon: ${weightController.text}');
              debugPrint('sport: ${sportController.text}');
              debugPrint('endurance: ${enduranceController.text}');
              debugPrint('speed: ${speedController.text}');
              debugPrint('flexibility: ${flexibilityController.text}');
              debugPrint('agility: ${agilityController.text}');
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }
}
