class CourseModel {
  final String title;
  final String description;
  final String gym;
  final String coach;

  CourseModel({
    required this.title,
    required this.description,
    required this.gym,
    required this.coach,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      title: json['title'],
      description: json['description'],
      gym: json['gym'],
      coach: json['coach'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'gym': gym,
      'coach': coach,
    };
  }
}
