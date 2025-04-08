import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationState {
  final Position? position;
  final bool isLoading;

  LocationState({this.position, this.isLoading = false});

  LocationState copyWith({
    Position? position,
    bool? isLoading,
  }) {
    return LocationState(
      position: position ?? this.position,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LocationLogic extends StateNotifier<LocationState> {
  LocationLogic() : super(LocationState());

  Future<void> fetchLocation() async {
    try {
      state = state.copyWith(isLoading: true);
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception("Konum servisleri kapalı");

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("İzin verilmedi");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("İzin tamamen reddedildi");
      }

      final position = await Geolocator.getCurrentPosition();
      state = state.copyWith(position: position, isLoading: false);
    } catch (e) {
      print("Konum alınamadı: $e");
      state = state.copyWith(isLoading: false);
    }
  }
}
