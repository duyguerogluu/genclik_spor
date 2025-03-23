import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class CreateCourseScreen extends StatefulWidget {
  const CreateCourseScreen({super.key});

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();

  void _saveCourse() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kurs başarıyla oluşturuldu!')),
      );

      _titleController.clear();
      _descriptionController.clear();
      _durationController.clear();
      _imageUrlController.clear();
      _capacityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: customAppBar("Kurs Oluştur"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_titleController, "Kurs Adı"),
              const SizedBox(height: 16),
              _buildTextField(_descriptionController, "Açıklama", maxLines: 3),
              const SizedBox(height: 16),
              _buildTextField(_durationController, "Süre (örn: 8 Hafta)"),
              const SizedBox(height: 16),
              _buildTextField(_capacityController, "Kontenjan"),
              const SizedBox(height: 16),
              _buildTextField(_imageUrlController, "Kurs Görsel URL"),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: darkblue,
                    padding: const EdgeInsets.symmetric(vertical: 16)),
                onPressed: _saveCourse,
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text("Kaydet",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText boş olamaz';
        }
        return null;
      },
    );
  }
}
