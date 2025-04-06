import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:genclik_spor/models/member_profile_model.dart';
import 'package:genclik_spor/services/profile_service.dart';
import 'package:genclik_spor/utils/holder.dart';

class ProfileRiverpod extends ChangeNotifier {
  MemberProfileModel? memberProfile;
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
}
