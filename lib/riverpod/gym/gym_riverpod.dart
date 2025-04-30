import 'package:flutter/widgets.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/services/gym_service.dart';
import 'package:genclik_spor/utils/holder.dart';

class GymRiverpod extends ChangeNotifier {
  List<GymModel> gyms = [];
  bool isLoading = false;

  Future<void> fetchGyms() async {
    debugPrint('Gyms Riverpod çalışıyor...');

    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      if (DataHolder.gymCache != null) {
        gyms = [...DataHolder.gymCache!];
      } else {
        debugPrint('Gyms çekiliyor...');
        gyms = await GymService.getGyms("Şahinbey", "Gaziantep");
        DataHolder.gymCache = [...gyms];
      }
    } catch (e) {
      debugPrint("Gym fetch error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshGyms() async {
    DataHolder.gymCache = null;
    await fetchGyms();
  }

  Future<void> hardRefreshGyms() async {
    debugPrint('Hard refresh yapılıyor...');
    DataHolder.gymCache = null;
    await fetchGyms();
  }
}
