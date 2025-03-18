import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:genclik_spor/models/athlete_model.dart';

class AthleteRiverpod extends ChangeNotifier {
  AthleteModel? athlete;
  bool isLoading = false;

  Future<void> fetchAthlete() async {
    debugPrint("fetchAthlete çalıştı");
    isLoading = true;
    notifyListeners();

    try {
      final String response =
          await rootBundle.loadString('assets/mocks/athlete.json');
      final data = json.decode(response);
      athlete = AthleteModel.fromMap(data);
    } catch (e) {
      debugPrint("Athlete verisi yüklenirken hata oluştu: \$e");
    }

    isLoading = false;
    notifyListeners();
  }
}
