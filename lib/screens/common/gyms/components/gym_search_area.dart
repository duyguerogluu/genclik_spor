import 'package:flutter/material.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:turkish/turkish.dart';

import 'city_district_dropdown.dart';

class GymSearchAreaWidget extends StatefulWidget {
  const GymSearchAreaWidget({
    super.key,
    required this.gymList,
    required this.currentCity,
    required this.currentDistrict,
    required this.onGymTap,
    required this.onCityDistrictSelected,
  });

  final List<GymModel> gymList;
  final String currentCity;
  final String currentDistrict;
  final void Function(GymModel) onGymTap;
  final void Function(String, String) onCityDistrictSelected;

  @override
  State<GymSearchAreaWidget> createState() => _GymSearchAreaWidgetState();
}

class _GymSearchAreaWidgetState extends State<GymSearchAreaWidget> {
  String? _filterTerm;

  List<GymModel> applyFilterToGyms(List<GymModel> gymsList) {
    if (_filterTerm?.trim().isNotEmpty ?? false) {
      final newList = gymsList
          .where((e) => e.gymName
              .toLowerCaseTr()
              .startsWith(_filterTerm!.toLowerCaseTr()))
          .toList();

      return newList;
    }

    return gymsList;
  }

  @override
  Widget build(BuildContext context) {
    final newList = applyFilterToGyms(widget.gymList);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SearchBar(
            onChanged: (value) {
              _filterTerm = value;
              setState(() {});
            },
            elevation: const WidgetStatePropertyAll(0),
            trailing: const [
              Icon(Icons.search),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                /*
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 4)
                              ],
                            ),
                            */
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      const Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Konum: ${widget.currentCity}, ${widget.currentDistrict}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 8),
                    CityDistrictDropdown(
                      onCityDistrictSelected: (city, district) {
                        Navigator.of(context).pop();
                        widget.onCityDistrictSelected(city, district);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: newList.length,
                  itemBuilder: (context, index) {
                    final gym = newList[index];

                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pop();

                        return widget.onGymTap(gym);
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          gym.imgUrl,
                          fit: BoxFit.cover,
                          width: 64,
                          height: 64,
                        ),
                      ),
                      title: Text(
                        gym.gymName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        gym.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
