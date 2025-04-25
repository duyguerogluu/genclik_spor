import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:genclik_spor/utils/const.dart';

class DistanceMatrixService {
  final List<String> _modes = ['driving', 'walking', 'bicycling', 'transit'];

  /// Süre metnini “dakika/saat/gün/saniye” formatına çevirir
  String _translateDuration(String text) {
    return text.replaceAllMapped(
      RegExp(r'(\d+)\s*(secs?|mins?|hours?|days?)', caseSensitive: false),
      (m) {
        final value = m.group(1);
        final unit = m.group(2)!.toLowerCase();
        if (unit.startsWith('sec')) return '$value saniye';
        if (unit.startsWith('min')) return '$value dakika';
        if (unit.startsWith('hour')) return '$value saat';
        if (unit.startsWith('day')) return '$value gün';
        return m.group(0)!;
      },
    );
  }

//km ve dakika cinsinden mesafe döndürür

  Future<Map<String, String>> getTravelInfo(
      LatLng origin, LatLng destination) async {
    final Map<String, String> results = {};

    for (var mode in _modes) {
      try {
        final uri = Uri.parse(
                'https://maps.googleapis.com/maps/api/distancematrix/json')
            .replace(queryParameters: {
          'origins': '${origin.latitude},${origin.longitude}',
          'destinations': '${destination.latitude},${destination.longitude}',
          'mode': mode,
          'departure_time': 'now',
          'key': googleApiKey,
        });

        final response = await http.get(uri);
        final data = jsonDecode(response.body);

        final element = data['rows'][0]['elements'][0];
        if (element['status'] == 'OK') {
          final rawText = element['duration']['text'] as String;
          results[mode] = _translateDuration(rawText);
        } else {
          results[mode] = 'N/A';
        }
      } catch (e) {
        log('Error getting travel time for $mode: $e');
        results[mode] = 'N/A';
      }
    }

    return results;
  }
}
