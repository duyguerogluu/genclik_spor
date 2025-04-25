import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/city_utils.dart';

class CityDistrictDropdown extends StatefulWidget {
  const CityDistrictDropdown({
    Key? key,
    required this.onCityDistrictSelected,
  }) : super(key: key);

  final void Function(String city, String district) onCityDistrictSelected;

  @override
  State<CityDistrictDropdown> createState() => _CityDistrictDropdownState();
}

class _CityDistrictDropdownState extends State<CityDistrictDropdown> {
  String? _selectedCity;
  String? _selectedDistrict;
  final _cities = CityUtils.getCities();

  @override
  Widget build(BuildContext context) {
    final _districts = _selectedCity != null
        ? CityUtils.getDistricts(_selectedCity!)
        : <String>[];

    return Row(
      children: [
        // City Dropdown
        Expanded(
          child: _buildDropdownField(
            label: 'İl seçiniz',
            icon: Icons.location_city,
            value: _selectedCity,
            items: _cities,
            onChanged: (city) {
              setState(() {
                _selectedCity = city;
                _selectedDistrict = null;
              });
            },
          ),
        ),

        const SizedBox(width: 16),

        // District Dropdown
        Expanded(
          child: _buildDropdownField(
            label: 'İlçe seçiniz',
            icon: Icons.map,
            value: _selectedDistrict,
            items: _districts,
            onChanged: (district) {
              setState(() {
                _selectedDistrict = district;
              });
              if (_selectedCity != null && _selectedDistrict != null) {
                widget.onCityDistrictSelected(
                  _selectedCity!,
                  _selectedDistrict!,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
                labelStyle: const TextStyle(fontSize: 14),  
            icon: Icon(icon, color: Colors.blueGrey),
            labelText: label,
            border: InputBorder.none,
          ),
          isExpanded: true,
          items: items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e, style: const TextStyle(fontSize: 14)),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
