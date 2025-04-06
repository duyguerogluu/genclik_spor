import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:genclik_spor/models/athlete_model.dart';
import 'package:genclik_spor/models/member_profile_model.dart';
import 'package:genclik_spor/services/profile_service.dart';
import 'package:genclik_spor/utils/holder.dart';

class ProfileRiverpod extends ChangeNotifier {
  MemberProfileModel? memberProfile;
  AthleteModel? athleteProfile;
  bool isLoading = false;

  Future<void> fetchProfile() async {
    debugPrint("Fetching profile...!!!!!!!!!!!!!!!!!");
    if (memberProfile != null || isLoading) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      memberProfile = await ProfileService.getProfile();
    } catch (e) {
      debugPrint("Profile fetch error: $e");
    }

    isLoading = false;
    notifyListeners();
  }



  Future<bool> fetchAthleteProfile(AthleteModel profile) async {
    debugPrint("Updating profile...!!!!!!!!!!!!!!!!!");
    isLoading = true;
    notifyListeners();

    try {
      final result = await ProfileService.updateProfile(profile);
      if (result) {
        athleteProfile = profile;
      }
      return result;
    } catch (e) {
      debugPrint("Profile update error: $e");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
