import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/athlete/myapps/my_application_screen.dart';
import 'package:genclik_spor/screens/athlete/trainingapplication/training_application_screen.dart';
import 'package:genclik_spor/screens/common/setting/setting_screen.dart';

import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class AthleteProfileScreen extends ConsumerWidget {
  const AthleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("AthleteProfileScreen build çalıştı!");
    final profileState = ref.watch(profileRiverpodNotifier);
    //Future.sync(profileRiverpod.fetchProfile(token) );

    Future<void> _loadProfile(String token) async {
  Future.sync(() => profileRiverpod.fetchProfile(token));
}

    if (profileState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (profileState.memberProfile == null) {
      return const Center(child: Text("Profil bilgileri yüklenemedi"));
    }

    final read = profileState.memberProfile!;

    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Sporcu Profili"),
            GestureDetector(
              child: Icon(Icons.settings, color: white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsScreen(),
                    ));
              },
            ),
          ],
        ),
        backgroundColor: offlightblue,
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
            const SizedBox(height: 20),
            _buildApplyButton(context),
            const SizedBox(height: 10),
            _buildMyApplicationsButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(read) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: darkblue,
              backgroundImage: NetworkImage(read.avatarUrl ?? ""),
              child: Icon(Icons.person, color: white, size: 40),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(read.firstName ?? "Bilgi Yok",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(read.sport,
                      style: TextStyle(color: Colors.grey[700], fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(
                    "Yaş: ${read.age ?? 'Bilinmiyor'} | Boy: ${read.height ?? 'Bilinmiyor'} cm | Kilo: ${read.weight ?? 'Bilinmiyor'} kg",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
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
        const Text("Performans Analizi",
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
          const Text("Antrenman Geçmişi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: read.trainingHistory.length,
              itemBuilder: (context, index) {
                final session = read.trainingHistory[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: white,
                  child: ListTile(
                    leading: Icon(Icons.sports_gymnastics, color: darkblue),
                    title: Text(session.date),
                    subtitle: Text("${session.sport} - ${session.status}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TrainingApplicationScreen()));
        },
        icon: const Icon(Icons.add),
        label: const Text("Yeni Antrenmana Başvur"),
        style: ElevatedButton.styleFrom(
          backgroundColor: darkblue,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildMyApplicationsButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyApplicationsScreen()));
        },
        icon: const Icon(Icons.assignment),
        label: const Text("Başvurularım"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange[800],
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildProgressBar(String label, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        LinearProgressIndicator(
          value: value / 100,
          minHeight: 8,
          backgroundColor: Colors.grey[300],
          color: darkblue,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
