import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Position?> getCurrentLocation() async {
  var status = await Permission.location.request();

  if (status.isGranted) {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Konum servisleri kapalı ");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || 
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || 
          permission == LocationPermission.deniedForever) {
        return Future.error("Konum izni verilmedi ");
      }
    }

    return await Geolocator.getCurrentPosition();
  } else {
    return Future.error("Konum izni reddedildi ");
  }
}
