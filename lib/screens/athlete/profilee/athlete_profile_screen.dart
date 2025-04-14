import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/models/member_profile_model.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/athlete/myapps/my_application_screen.dart';
import 'package:genclik_spor/screens/athlete/profilee/components/course_button.dart';
import 'package:genclik_spor/screens/athlete/profilee/manage_athlete_profile_screen.dart';
import 'package:genclik_spor/screens/athlete/trainingapplication/training_application_screen.dart';
import 'package:genclik_spor/screens/common/components/custom_button.dart';
import 'package:genclik_spor/screens/common/setting/setting_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class MemberProfileScreen extends ConsumerStatefulWidget {
  const MemberProfileScreen({super.key});

  @override
  ConsumerState<MemberProfileScreen> createState() =>
      _AthleteProfileScreenState();
}

class _AthleteProfileScreenState extends ConsumerState<MemberProfileScreen> {
  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    await ref.read(profileRiverpodNotifier.notifier).fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("AthleteProfileScreen build çalıştı!");
    final profileState = ref.watch(profileRiverpodNotifier);

    if (profileState.isLoading) {
      return Scaffold(
        backgroundColor: context.isDark ? offdarkblue : white1,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (profileState.memberProfile == null) {
      return Scaffold(
        backgroundColor: context.isDark ? offdarkblue : white1,
        body: const Center(child: Text("Profil bilgileri yüklenemedi")),
      );
    }

    final read = profileState.memberProfile!;

    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Üye Profili"),
            GestureDetector(
              child: Icon(Icons.edit, color: white),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(read),
              const SizedBox(height: 20),
              Center(
                child: customButton(
                    context: context,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ManageAthleteProfileScreen()));
                    },
                    text: 'Sporcu Bilgilerini Gir'),
              ),
              _buildPerformanceAnalysis(read),
              const SizedBox(height: 20),
              _buildTrainingHistory(read),
              courseButton(context),
              const SizedBox(height: 20),
              _buildApplyButton(context),
              const SizedBox(height: 10),
              _buildMyApplicationsButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(MemberProfileModel read) {
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
                  const Text("Üye Bilgileri",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${read.firstName} ${read.lastName}' ?? "Bilgi Yok",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(read.athleteProfile?.sport ?? 'Bilgi yok',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(
                    "Yaş: ${read.athleteProfile?.age ?? 'Bilinmiyor'} | Boy: ${read.athleteProfile?.height ?? 'Bilinmiyor'} cm | Kilo: ${read.athleteProfile?.weight ?? 'Bilinmiyor'} kg",
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

  Widget _buildPerformanceAnalysis(MemberProfileModel read) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Performans Analizi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _buildProgressBar("Dayanıklılık", read.athleteProfile?.endurance ?? -1),
        _buildProgressBar("Hız", read.athleteProfile?.speed ?? -1),
        _buildProgressBar("Esneklik", read.athleteProfile?.flexibility ?? -1),
        _buildProgressBar("Çeviklik", read.athleteProfile?.agility ?? -1),
      ],
    );
  }

  Widget _buildTrainingHistory(MemberProfileModel read) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Antrenman Geçmişi",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          if ((read.athleteProfile?.trainingHistory.length ?? 0) > 0)
            Expanded(
              child: ListView.builder(
                itemCount: read.athleteProfile!.trainingHistory.length,
                itemBuilder: (context, index) {
                  final session = read.athleteProfile!.trainingHistory[index];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: white,
                    child: ListTile(
                      leading: Icon(Icons.sports_gymnastics, color: darkblue),
                      title: Text(session.date),
                      subtitle: Text(session.focus),
                    ),
                  );
                },
              ),
            ),
        ],
      
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
        icon: Icon(Icons.add, color: white),
        label: Text("Yeni Antrenmana Başvur", style: TextStyle(color: white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: offlightblue,
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
