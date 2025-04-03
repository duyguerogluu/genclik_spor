import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/athlete/athlete_riverpod.dart';
import 'package:genclik_spor/riverpod/common/login_riverpod.dart';
import 'package:genclik_spor/riverpod/common/register_riverpod.dart';

final login = LoginRiverpod();
final register = RegisterRiverpod();
final athleteRiverpod = AthleteRiverpod();
final athleteRiverpodNotifier =
    ChangeNotifierProvider<AthleteRiverpod>((_) => athleteRiverpod);
