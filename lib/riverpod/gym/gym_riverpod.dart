import 'package:flutter/widgets.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/services/gym_service.dart';
import 'package:genclik_spor/utils/holder.dart';

class GymRiverpod extends ChangeNotifier {
  List<GymModel> gyms = [];
  bool isLoading = false;

  Future<void> fetchGyms() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    notifyListeners();

    if (DataHolder.gymCache != null) {
      gyms = [...DataHolder.gymCache!];
    } else {
      try {
        gyms = await GymService.getGyms();
        DataHolder.gymCache = [...gyms];
      } catch (e) {
        debugPrint("Gym fetch error: $e");
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
