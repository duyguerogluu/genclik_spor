import 'package:geocoding/geocoding.dart';

class Adress {
  Future<MapEntry<String, String>?> getAddressFromLatLng(
      double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;
        print('İl: ${place.administrativeArea}');
        print('İlçe: ${place.subAdministrativeArea}');
        return MapEntry(
            place.administrativeArea!, place.subAdministrativeArea!);
      }
    } catch (e) {
      print('Hata oluştu: $e');
    }
    return null;
  }
}
