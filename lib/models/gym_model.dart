import 'package:genclik_spor/utils/const.dart';

class GymModel {
  final String gymName;
  final String address;
  final String imgUrl;
  final double lat;
  final double lng;

  GymModel({
    required this.gymName,
    required this.address,
    required this.imgUrl,
    required this.lat,
    required this.lng,
  });

  factory GymModel.fromJson(Map<String, dynamic> json) {
    String rawUrl = json['imgUrl'] ?? '';
    String imgUrl = rawUrl.replaceAll("YOUR_PLACES_API_KEY", googleApiKey);
    return GymModel(
      gymName: json['gymName'] ?? '',
      address: json['address'] ?? '',
      imgUrl: imgUrl,
      lat: json['lat'] ?? 0.0,
      lng: json['lng'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gymName': gymName,
      'address': address,
      'imgUrl': imgUrl,
      'lat': lat,
      'lng': lng,
    };
  }
}
