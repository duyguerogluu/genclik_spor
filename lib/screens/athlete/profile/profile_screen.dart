import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';


class AthleteProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final athlete = ref.read(athlete1);

    return Scaffold(
      appBar: AppBar(title: Text("Sporcu Profili")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(athlete),
            SizedBox(height: 20),
            _buildPerformanceAnalysis(athlete),
            SizedBox(height: 20),
            _buildTrainingHistory(athlete),
            SizedBox(height: 10),
            _buildApplyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(Athlete athlete) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/profile_placeholder.png"),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(athlete.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(athlete.sport, style: TextStyle(color: Colors.grey[700])),
                Text("Yaş: ${athlete.age} | Boy: ${athlete.height} cm | Kilo: ${athlete.weight} kg"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceAnalysis(Athlete athlete) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Performans Analizi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        _buildProgressBar("Dayanıklılık", athlete.endurance),
        _buildProgressBar("Hız", athlete.speed),
        _buildProgressBar("Esneklik", athlete.flexibility),
        _buildProgressBar("Çeviklik", athlete.agility),
      ],
    );
  }

  Widget _buildTrainingHistory(Athlete athlete) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Antrenman Geçmişi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: athlete.trainingHistory.length,
              itemBuilder: (context, index) {
                final session = athlete.trainingHistory[index];
                return ListTile(
                  leading: Icon(Icons.sports_basketball, color: Colors.blue),
                  title: Text(session.date),
                  subtitle: Text("${session.sport} - ${session.status}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Yeni Antrenmana Başvur"),
      ),
    );
  }

  Widget _buildProgressBar(String label, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 5),
        LinearProgressIndicator(value: value / 100, minHeight: 8),
        SizedBox(height: 10),
      ],
    );
  }
}

class Athlete {
  final String name;
  final int age;
  final int height;
  final int weight;
  final String sport;
  final int endurance;
  final int speed;
  final int flexibility;
  final int agility;
  final List<TrainingSession> trainingHistory;

  Athlete({
    required this.name,
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
}

class TrainingSession {
  final String date;
  final String sport;
  final String status;

  TrainingSession({required this.date, required this.sport, required this.status});
}
