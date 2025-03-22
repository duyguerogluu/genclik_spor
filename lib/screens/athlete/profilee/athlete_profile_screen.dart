import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/models/athlete_model.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

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
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: AppBar(
        title: const Text("Sporcu Profili"),
        backgroundColor: darkblue,
        foregroundColor: white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(read),
            const SizedBox(height: 20),
            _buildPerformanceAnalysis(read),
            const SizedBox(height: 20),
            _buildTrainingHistory(read),
            const SizedBox(height: 10),
            _buildApplyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(read) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: white,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              //backgroundImage: NetworkImage(
              //  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh7-m2anFLaH9UxDgrlvlXUwpds79K10S-IQ&s"),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  read.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  read.sport,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  "Yaş: ${read.age} | Boy: ${read.height} cm | Kilo: ${read.weight} kg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceAnalysis(read) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Performans Analizi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _buildProgressBar("Dayanıklılık", read.endurance),
        _buildProgressBar("Hız", read.speed),
        _buildProgressBar("Esneklik", read.flexibility),
        _buildProgressBar("Çeviklik", read.agility),
      ],
    );
  }

  Widget _buildTrainingHistory(read) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Antrenman Geçmişi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: read.trainingHistory.length,
              itemBuilder: (context, index) {
                final session = read.trainingHistory[index];
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
