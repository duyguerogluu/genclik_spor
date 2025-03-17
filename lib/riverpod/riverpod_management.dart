import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/common/login_riverpod.dart';

final login = LoginRiverpod();
final athlete1 =   ChangeNotifierProvider((_) => LoginRiverpod());

