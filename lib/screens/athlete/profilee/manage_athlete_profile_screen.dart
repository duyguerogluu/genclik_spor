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
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    emailController.dispose();
    phoneController.dispose();
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
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: emailController,
                  hintText: 'E-posta',
                  obscureText: false,
                  onVisibilityToggle: () {},
                  isDark: false,
                ),
                const SizedBox(height: 16),
                customTextField(
                  controller: phoneController,
                  hintText: 'Telefon Numarası',
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
              debugPrint('Email: ${emailController.text}');
              debugPrint('Telefon: ${phoneController.text}');
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }
}
