import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/models/athlete_model.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';

class AthleteProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("AthleteProfileScreen build çalıştı!!!!!!!!!!!!!!!!!");
    final athleteState = ref.watch(athleteRiverpodNotifier);
    Future.sync(athleteRiverpod.fetchAthlete);
    final read = athleteState.athlete;

    if (athleteState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (read == null) {
      return const Center(child: Text("Veri yüklenemedi"));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Sporcu Profili")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(read),
            const SizedBox(height: 20),
            // _buildPerformanceAnalysis(read),
            const SizedBox(height: 20),
            // _buildTrainingHistory(read),
            const SizedBox(height: 10),
            // _buildApplyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(AthleteModel athlete) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              // backgroundImage: AssetImage("assets/profile_placeholder.png"),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(athlete.name,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(athlete.sport, style: TextStyle(color: Colors.grey[700])),
                Text(
                    "Yaş: ${athlete.age} | Boy: ${athlete.height} cm | Kilo: ${athlete.weight} kg"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceAnalysis(AthleteModel athlete) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Performans Analizi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _buildProgressBar("Dayanıklılık", athlete.endurance),
        _buildProgressBar("Hız", athlete.speed),
        _buildProgressBar("Esneklik", athlete.flexibility),
        _buildProgressBar("Çeviklik", athlete.agility),
      ],
    );
  }

  Widget _buildTrainingHistory(AthleteModel athlete) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Antrenman Geçmişi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
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
        const SizedBox(height: 5),
        LinearProgressIndicator(value: value / 100, minHeight: 8),
        const SizedBox(height: 10),
      ],
    );
  }
}
