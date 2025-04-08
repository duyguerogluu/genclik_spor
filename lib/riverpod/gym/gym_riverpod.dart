import 'package:flutter/widgets.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/services/gym_service.dart';

class GymRiverpod extends ChangeNotifier {
  GymModel? gym;
  bool isLoading = false;

  Future<void> fetchGym() async {
    if (gym != null || isLoading) {
      return;
    }

    try {
      gym = await GymService.getGyms(
        city: "Gaziantep",
        district: "Şahinbey",
      );
    } catch (e) {
      debugPrint("Gym fetch error: $e");
    }
    isLoading = false;
    notifyListeners();
  }
}
