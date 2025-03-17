class AthleteModel {
  final String name;
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
    required this.name,
    required this.role,
    required this.age,
    required this.height,
    required this.weight,
    required this.sport,
    required this.endurance,
    required this.speed,
    required this.flexibility,
    required this.agility,
    required this.trainingHistory,
  });

  factory AthleteModel.fromMap(Map<String, dynamic> map) {
    return AthleteModel(
      name: map['name'],
      role: map['role'],
      age: map['age'],
      height: map['height'],
      weight: map['weight'],
      sport: map['sport'],
      endurance: map['endurance'],
      speed: map['speed'],
      flexibility: map['flexibility'],
      agility: map['agility'],
      trainingHistory: (map['trainingHistory'] as List)
          .map((item) => TrainingHistory.fromMap(item))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'age': age,
      'height': height,
      'weight': weight,
      'sport': sport,
      'endurance': endurance,
      'speed': speed,
      'flexibility': flexibility,
      'agility': agility,
      'trainingHistory': trainingHistory.map((e) => e.toMap()).toList(),
    };
  }
}

class TrainingHistory {
  final String date;
  final String sport;
  final String status;

  TrainingHistory({
    required this.date,
    required this.sport,
    required this.status,
  });

  factory TrainingHistory.fromMap(Map<String, dynamic> map) {
    return TrainingHistory(
      date: map['date'],
      sport: map['sport'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'sport': sport,
      'status': status,
    };
  }
}
