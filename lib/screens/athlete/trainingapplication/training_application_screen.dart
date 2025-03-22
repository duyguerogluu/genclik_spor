import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class TrainingApplicationScreen extends StatefulWidget {
  const TrainingApplicationScreen({super.key});

  @override
  State<TrainingApplicationScreen> createState() => _TrainingApplicationScreenState();
}

class _TrainingApplicationScreenState extends State<TrainingApplicationScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedBranch = 'Basketbol';
  final TextEditingController notesController = TextEditingController();

  final List<String> branches = [
    'Basketbol',
    'Voleybol',
    'Yüzme',
    'Futbol',
    'Tenis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: AppBar(
        title: const Text('Antrenman Başvurusu'),
        backgroundColor: darkblue,
        foregroundColor: white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Branş Seçiniz',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedBranch,
                items: branches.map((branch) {
                  return DropdownMenuItem(
                    value: branch,
                    child: Text(branch),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBranch = value!;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Notlar (Opsiyonel)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: notesController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Eklemek istediğin notları yaz...',
                  filled: true,
                  fillColor: white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkblue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // API isteği buraya gelecek
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Başvurun alındı!')),
                      );
                    }
                  },
                  child: const Text('Başvur', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
