import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/models/course_model.dart';
import 'package:genclik_spor/riverpod/athlete/athlete_riverpod.dart';
import 'package:genclik_spor/riverpod/common/location_logic.dart';
import 'package:genclik_spor/riverpod/common/login_riverpod.dart';
import 'package:genclik_spor/riverpod/common/register_riverpod.dart';
import 'package:genclik_spor/riverpod/course/course_riverpod.dart';
import 'package:genclik_spor/riverpod/gym/gym_riverpod.dart';
import 'package:genclik_spor/riverpod/profile/profile_riverpod.dart';

final login = LoginRiverpod();
final register = RegisterRiverpod();
final profile = ProfileRiverpod();
final athleteRiverpod = AthleteRiverpod();
final athleteRiverpodNotifier =
    ChangeNotifierProvider<AthleteRiverpod>((_) => athleteRiverpod);
final profileRiverpodNotifier =
    ChangeNotifierProvider<ProfileRiverpod>((_) => profile);

final locationLogic = LocationLogic();
final locationLogicProvider =
    StateNotifierProvider<LocationLogic, LocationState>((ref) => locationLogic);

final gymRiverpod = ChangeNotifierProvider<GymRiverpod>((ref) => GymRiverpod());
final courseRiverpod = ChangeNotifierProvider<CourseRiverpod>((ref) => CourseRiverpod());

    