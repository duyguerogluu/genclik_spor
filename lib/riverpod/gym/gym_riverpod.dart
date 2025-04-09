import 'package:flutter/widgets.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/services/gym_service.dart';

class GymRiverpod extends ChangeNotifier {
  List<GymModel> gyms = [];
  bool isLoading = false;

  Future<void> fetchGyms() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      gyms = await GymService.getGyms(
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
