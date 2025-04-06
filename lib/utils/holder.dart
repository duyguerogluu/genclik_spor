import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:genclik_spor/models/login_model.dart';

class DataHolder {
  DataHolder._();

  static LoginModel? loginModel;
  static FlutterSecureStorage? secureStorage;

  static Future<String?> getToken() => secureStorage!.read(key: 'token');

  static Future<void> putToken(String token) =>
      secureStorage!.write(key: 'token', value: token);
}
