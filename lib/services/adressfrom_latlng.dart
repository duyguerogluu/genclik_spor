import 'package:geocoding/geocoding.dart';

class Adress{
  Future<void> getAddressFromLatLng(double lat, double lng) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

    if (placemarks.isNotEmpty) {
      final Placemark place = placemarks.first;
      print('İl: ${place.administrativeArea}');
      print('İlçe: ${place.subAdministrativeArea}');
    }
  } catch (e) {
    print('Hata oluştu: $e');
  }
}
}