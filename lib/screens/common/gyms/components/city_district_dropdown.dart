import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/city_utils.dart';

class CityDistrictDropdown extends StatefulWidget {
  const CityDistrictDropdown({
    super.key,
    required this.onCityDistrictSelected,
  });

  final void Function(String, String) onCityDistrictSelected;

  @override
  State<CityDistrictDropdown> createState() => _CityDistrictDropdownState();
}

class _CityDistrictDropdownState extends State<CityDistrictDropdown> {
  String? selectedCity;
  String? selectedDistrict;
  final cities = CityUtils.getCities();
  @override
  Widget build(BuildContext context) {
    final districts =
        selectedCity != null ? CityUtils.getDistricts(selectedCity!) : [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text("İl seçiniz"),
              value: selectedCity,
              items: cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (city) {
                setState(() {
                  selectedCity = city;
                  selectedDistrict = null;
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text("İlçe seçiniz"),
              value: selectedDistrict,
              items: districts.map((district) {
                return DropdownMenuItem<String>(
                  value: district,
                  child: Text(district),
                );
              }).toList(),
              onChanged: (district) {
                setState(() {
                  selectedDistrict = district;
                });

                widget.onCityDistrictSelected(
                  selectedCity!,
                  selectedDistrict!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
