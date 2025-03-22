class WarningModel {
  final String title;
  final String description;

  WarningModel({required this.title, required this.description});

  factory WarningModel.fromJson(Map<String, dynamic> json) {
    return WarningModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}