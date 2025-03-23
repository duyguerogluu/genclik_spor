class ApplicationModel {
  final String branch;
  final String gym;
  final String coach;
  final String status;

  ApplicationModel({
    required this.branch,
    required this.gym,
    required this.coach,
    required this.status,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      branch: json['branch'],
      gym: json['gym'],
      coach: json['coach'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branch': branch,
      'gym': gym,
      'coach': coach,
      'status': status,
    };
  }
}
