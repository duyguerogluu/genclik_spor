import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/city_utils.dart';

class CityDistrictDropdown extends StatefulWidget {
  @override
  _CityDistrictDropdownState createState() => _CityDistrictDropdownState();
}

class _CityDistrictDropdownState extends State<CityDistrictDropdown> {
  String? selectedCity;
  String? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    final cities = CityUtils.getCities();
    final districts =
        selectedCity != null ? CityUtils.getDistricts(selectedCity!) : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
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
        SizedBox(height: 16),
        DropdownButton<String>(
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
          },
        ),
      ],
    );
  }
}
