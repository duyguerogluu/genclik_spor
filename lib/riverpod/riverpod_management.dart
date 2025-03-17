import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/athlete/athlete_riverpod.dart';
import 'package:genclik_spor/riverpod/common/login_riverpod.dart';

final login = LoginRiverpod();
final athleteRiverpod = ChangeNotifierProvider((_) => AthleteRiverpod());
