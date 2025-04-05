import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:genclik_spor/models/login_model.dart';

class DataHolder {
  static LoginModel? loginModel;
  static FlutterSecureStorage? secureStorage;
}
