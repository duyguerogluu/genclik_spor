class AthleteModel {
  final int? id;
  final int? memberID;
  final String role;
  final int age;
  final int height;
  final int weight;
  final String sport;
  final int endurance;
  final int speed;
  final int flexibility;
  final int agility;
  final List<TrainingHistory> trainingHistory;

  AthleteModel({
    this.id,
    this.memberID,
    required this.role,
    required this.age,
    required this.height,
    required this.weight,
    required this.sport,
    required this.endurance,
    required this.speed,
    required this.flexibility,
    required this.agility,
    this.trainingHistory = const [],
  });

  factory AthleteModel.fromJson(Map<String, dynamic> json) {
    return AthleteModel(
      id: json['id'],
      memberID: json['member_id'],
      role: json['role'] ?? 'Unknown',
      age: json['age'] ?? 0,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      sport: json['sport'] ?? 'Unknown',
      endurance: json['endurance'] ?? 0,
      speed: json['speed'] ?? 0,
      flexibility: json['flexibility'] ?? 0,
      agility: json['agility'] ?? 0,
      trainingHistory: (json['training_histories'] as List<dynamic>?)
              ?.map((item) => TrainingHistory.fromMap(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      if (memberID != null) 'member_id': memberID,
      'role': role,
      'age': age,
      'height': height,
      'weight': weight,
      'sport': sport,
      'endurance': endurance,
      'speed': speed,
      'flexibility': flexibility,
      'agility': agility,
      'training_histories': trainingHistory.map((e) => e.toMap()).toList(),
    };
  }
}

class TrainingHistory {
  final String date;
  final int duration;
  final String focus;

  TrainingHistory({
    required this.date,
    required this.duration,
    required this.focus,
  });

  factory TrainingHistory.fromMap(Map<String, dynamic> map) {
    return TrainingHistory(
      date: map['date'] ?? '',
      duration: map['duration'] ?? 0,
      focus: map['focus'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'duration': duration,
      'focus': focus,
    };
  }
}
