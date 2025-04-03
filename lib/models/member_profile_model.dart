import 'package:genclik_spor/models/athlete_model.dart';

class MemberProfileModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatarUrl;
  final AthleteModel? athleteProfile;

  MemberProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
    this.athleteProfile,
  });

  factory MemberProfileModel.fromJson(Map<String, dynamic> json) {
    return MemberProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatarUrl: json['avatar_url'],
      athleteProfile: json['athlete_profile'] != null
          ? AthleteModel.fromJson(json['athlete_profile'])
          : null,
    );
  }
}
