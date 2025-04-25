
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:genclik_spor/utils/const.dart';

/// Google Haritalar API'leri aracılığıyla Coğrafi Kodlama ve Yerler Otomatik Tamamlama
class GeocodingService {
  final String apiKey = googleApiKey;
  final http.Client _client = http.Client();

  /// Belirli bir şehir + ilçe için LatLng'yi döndürür
  Future<LatLng?> geocodeCityDistrict(String city, String district) async {
    final address = Uri.encodeComponent('$district, $city, Turkey');
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey';
    final resp = await _client.get(Uri.parse(url));
    final data = jsonDecode(resp.body) as Map<String, dynamic>;
    if (data['status'] == 'OK' && (data['results'] as List).isNotEmpty) {
      final loc = data['results'][0]['geometry']['location'] as Map<String, dynamic>;
      return LatLng(loc['lat'] as double, loc['lng'] as double);
    }
    return null;
  }

  /// Bir ilçe için mahalle (mahalle) adlarını almak için otomatik tamamlama
  Future<List<String>> getNeighborhoods(String city, String district) async {
    final input = Uri.encodeComponent('$district, $city');
    final url = 
        'https://maps.googleapis.com/maps/api/place/autocomplete/json'
        '?input=$input'
        '&types=(regions)'
        '&components=country:tr'
        '&key=$apiKey';
    final resp = await _client.get(Uri.parse(url));
    final data = jsonDecode(resp.body) as Map<String, dynamic>;
    if (data['status'] == 'OK') {
      return (data['predictions'] as List)
          .map((p) => p['description'] as String)
          .toList();
    }
    return [];
  }

  /// Seçilen mahalleyi enlem/boylam olarak coğrafi olarak kodla
  Future<LatLng?> geocodeNeighborhood(
      String city, String district, String mahalle) async {
    final address = Uri.encodeComponent('$mahalle, $district, $city, Turkey');
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey';
    final resp = await _client.get(Uri.parse(url));
    final data = jsonDecode(resp.body) as Map<String, dynamic>;
    if (data['status'] == 'OK' && (data['results'] as List).isNotEmpty) {
      final loc = data['results'][0]['geometry']['location'] as Map<String, dynamic>;
      return LatLng(loc['lat'] as double, loc['lng'] as double);
    }
    return null;
  }
}
