class CourseModel {
  final String title;
  final String description;
  final String coachName;
  final String duration;
  final String imageUrl;

  CourseModel({
    required this.title,
    required this.description,
    required this.coachName,
    required this.duration,
    required this.imageUrl,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        title: json['title'],
        description: json['description'],
        coachName: json['coachName'],
        duration: json['duration'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'coachName': coachName,
        'duration': duration,
        'imageUrl': imageUrl,
      };
}
