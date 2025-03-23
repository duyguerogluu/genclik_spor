class TrainingApplicationModel {
  final String userId;
  final String gymId;
  final String coachId;
  final String courseId;
  final String note;

  TrainingApplicationModel({
    required this.userId,
    required this.gymId,
    required this.coachId,
    required this.courseId,
    required this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'gymId': gymId,
      'coachId': coachId,
      'courseId': courseId,
      'note': note,
    };
  }
}
