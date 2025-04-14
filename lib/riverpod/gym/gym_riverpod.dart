import 'package:flutter/widgets.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/services/gym_service.dart';
import 'package:genclik_spor/utils/holder.dart';

class GymRiverpod extends ChangeNotifier {
  List<GymModel> gyms = [];
  bool isLoading = false;

  Future<void> fetchGyms() async {
    debugPrint('Gyms Riverpod Çalışıyor    ...!!!!!!!!!!!!!!!!!!!!!!');
    if (isLoading) {
      return;
    }

    isLoading = true;
    notifyListeners();

    if (DataHolder.gymCache != null) {
      gyms = [...DataHolder.gymCache!];
    } else {
      try {
        debugPrint('Gyms Çekiliyor...!!!!!!!!!!!!!!!!!!!!!!');
        gyms = await GymService.getGyms("Şahinbey", "Gaziantep");
        DataHolder.gymCache = [...gyms];
      } catch (e) {
        debugPrint("Gym fetch error: $e");
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
