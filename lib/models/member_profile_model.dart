import 'package:genclik_spor/models/athlete_model.dart';

class MemberProfileModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? description;
  final String? gender;
  final String? email;
  final String? dob;
  final String? phone;
  final String confirmedAt;
  final String? emailVerifyToken;
  final String createdAt;
  final String updatedAt;
  final String status;
  final String avatarUrl;
  final AthleteModel? athleteProfile;

  MemberProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.gender,
    required this.email,
    required this.dob,
    required this.phone,
    required this.confirmedAt,
    required this.emailVerifyToken,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.avatarUrl,
    this.athleteProfile,
  });

  factory MemberProfileModel.fromJson(Map<String, dynamic> json) {
    return MemberProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      description: json['description'],
      gender: json['gender'],
      email: json['email'],
      dob: json['dob'],
      phone: json['phone'],
      confirmedAt: json['confirmed_at'],
      emailVerifyToken: json['email_verify_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status'],
      avatarUrl: json['avatar_url'],
      athleteProfile: json['athlete_profile'] != null
          ? AthleteModel.fromJson(json['athlete_profile'])
          : null,
    );
  }
}
