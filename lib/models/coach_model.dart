class CoachModel {
  final String name;
  final String branch;
  final String experience;

  CoachModel({
    required this.name,
    required this.branch,
    required this.experience,
  });

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
      name: json['name'],
      branch: json['branch'],
      experience: json['experience'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'branch': branch,
      'experience': experience,
    };
  }
}
