import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/athlete/athlete_riverpod.dart';
import 'package:genclik_spor/riverpod/common/login_riverpod.dart';
import 'package:genclik_spor/riverpod/common/register_riverpod.dart';
import 'package:genclik_spor/riverpod/profile/profile_riverpod.dart';

final login = LoginRiverpod();
final register = RegisterRiverpod();
final profileRiverpod = ProfileRiverpod();
final athleteRiverpod = AthleteRiverpod();
final athleteRiverpodNotifier =
    ChangeNotifierProvider<AthleteRiverpod>((_) => athleteRiverpod);
final profileRiverpodNotifier =
    ChangeNotifierProvider<ProfileRiverpod>((_) => profileRiverpod);
