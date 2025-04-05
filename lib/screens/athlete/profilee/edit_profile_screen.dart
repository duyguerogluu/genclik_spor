import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/screens/common/components/custom_text_field.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: customAppBar('Profil Düzenle'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Geri Dön"),
          ),
        ],
      ),
    );
  }
} 