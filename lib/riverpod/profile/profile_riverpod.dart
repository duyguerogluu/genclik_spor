import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:genclik_spor/models/athlete_model.dart';
import 'package:genclik_spor/models/member_profile_model.dart';
import 'package:genclik_spor/screens/common/components/custom_dropdown.dart';
import 'package:genclik_spor/services/profile_service.dart';
import 'package:genclik_spor/utils/holder.dart';

class ProfileRiverpod extends ChangeNotifier {
  MemberProfileModel? memberProfile;
  AthleteModel? athleteProfile;
  bool isLoading = false;

  Future<void> fetchProfile() async {
    debugPrint("Fetching profile...!!!!!!!!!!!!!!!!!");
    if (isLoading) {
      return;
    }

    isLoading = true;
    notifyListeners();

    if (DataHolder.memberProfile != null) {
      memberProfile = DataHolder.memberProfile;
    } else {
      try {
        debugPrint('profil bilggileri çekiliyor...!!!!!!!!!!!!!!!!!!!!!!1');
        memberProfile = await ProfileService.getProfile();

        DataHolder.memberProfile = memberProfile;
      } catch (e) {
        debugPrint("Profile fetch error: $e");
      }
    }

    isLoading = false;
    notifyListeners();
  }

  Future<bool> updateAthleteProfile(AthleteModel profile) async {
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
