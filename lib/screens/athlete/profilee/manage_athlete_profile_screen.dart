import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/models/athlete_model.dart';
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
  final roleController = TextEditingController();
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
    roleController.dispose();
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

  void initState() {
    super.initState();
    final athlete = ref.read(profileRiverpodNotifier).athleteProfile;
    if (athlete == null) {
      debugPrint('Athlete bilgileri bulunamadı!');
      return;
    }

    if (athlete != null) {
      roleController.text = athlete.role?.toString() ?? '';
      ageController.text = athlete.age?.toString() ?? '';
      heightController.text = athlete.height?.toString() ?? '';
      weightController.text = athlete.weight?.toString() ?? '';
      sportController.text = athlete.sport ?? '';
      enduranceController.text = athlete.endurance?.toString() ?? '';
      speedController.text = athlete.speed?.toString() ?? '';
      flexibilityController.text = athlete.flexibility?.toString() ?? '';
      agilityController.text = athlete.agility?.toString() ?? '';
    }
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
                // CustomDropdown(
                //   controller: roleController,
                //   label: 'Seviye Seçin',
                // ),
                // const SizedBox(height: 16),
                customTextField(
                  controller: roleController,
                  hintText: 'Seviyeniz Nedir? (Örn: Profesyonel)',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                  numberOnly: true,
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
                  hintText: 'endurance',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: speedController,
                  hintText: 'speed',
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
            onPressed: () async {
              debugPrint('Soyad: ${roleController.text}');
              debugPrint('Soyad: ${ageController.text}');
              debugPrint('Email: ${heightController.text}');
              debugPrint('Telefon: ${weightController.text}');
              debugPrint('sport: ${sportController.text}');
              debugPrint('endurance: ${enduranceController.text}');
              debugPrint('speed: ${speedController.text}');
              debugPrint('flexibility: ${flexibilityController.text}');
              debugPrint('agility: ${agilityController.text}');
              final res =
                  await ref.read(profileRiverpodNotifier).updateAthleteProfile(
                        AthleteModel(
                          role: roleController.text,
                          age: int.parse(ageController.text),
                          height: int.parse(heightController.text),
                          weight: int.parse(weightController.text),
                          sport: sportController.text,
                          endurance: int.parse(enduranceController.text),
                          speed: int.parse(speedController.text),
                          flexibility: int.parse(flexibilityController.text),
                          agility: int.parse(agilityController.text),
                        ),
                      );
              if (res == true) {
                debugPrint('Profil güncellendi!!!!!!!!!!!');
                // ignore: use_build_context_synchronously
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
