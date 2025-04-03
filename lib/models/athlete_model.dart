class AthleteModel {
  final String firstName;
  final String lastName;
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
    required this.firstName,
    required this.lastName,
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
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      role: map['role'] ?? 'Unknown',
      age: map['age'] ?? 0,
      height: map['height'] ?? 0,
      weight: map['weight'] ?? 0,
      sport: map['sport'] ?? 'Unknown',
      endurance: map['endurance'] ?? 0,
      speed: map['speed'] ?? 0,
      flexibility: map['flexibility'] ?? 0,
      agility: map['agility'] ?? 0,
      trainingHistory: (map['training_histories'] as List<dynamic>?)
              ?.map((item) => TrainingHistory.fromMap(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
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
