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

  // JSON'dan GymModel oluşturma
  factory GymModel.fromJson(Map<String, dynamic> json) {
    return GymModel(
      gymName: json['gymName'] ?? '',
      address: json['address'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      lat: json['lat'] ?? 0.0,
      lng: json['lng'] ?? 0.0,
    );
  }

  // GymModel'den JSON'a dönüştürme
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
