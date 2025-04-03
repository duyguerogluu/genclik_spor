import 'package:flutter/material.dart';
import 'package:genclik_spor/models/member_profile_model.dart';
import 'package:genclik_spor/services/profile_service.dart';

class ProfileRiverpod extends ChangeNotifier {
  MemberProfileModel? memberProfile;
  bool isLoading = false;

  Future<void> fetchProfile(String token) async {
    if (memberProfile != null || isLoading) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      memberProfile = await ProfileService.getProfile(token);
    } catch (e) {
      print("Profile fetch error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
