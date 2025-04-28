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
      _MemberProfileScreenState();
}

class _MemberProfileScreenState extends ConsumerState<MemberProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async {
      await ref.read(profileRiverpodNotifier.notifier).fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileRiverpodNotifier);

    if (profileState.isLoading) {
      return Scaffold(
        backgroundColor:
            context.isDark ? const Color(0xFF002F7B) : Colors.white,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (profileState.memberProfile == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Üye Profili"),
          backgroundColor: const Color(0xFF3C6BC3),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: const Center(child: Text("Profil bilgileri yüklenemedi")),
      );
    }

    final member = profileState.memberProfile!;

    return Scaffold(
      backgroundColor:
          context.isDark ? const Color(0xFF001F4A) : const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C6BC3),
        foregroundColor: Colors.white,
        title: const Text("Üye Profili"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          )
        ],
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(profileRiverpodNotifier.notifier).fetchProfile();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(member),
              const SizedBox(height: 20),
              _buildInfoButton(context),
              const SizedBox(height: 20),
              _buildSectionTitle("Performans Analizi"),
              const SizedBox(height: 10),
              _buildProgress(
                  "Dayanıklılık", member.athleteProfile?.endurance ?? -1),
              _buildProgress("Hız", member.athleteProfile?.speed ?? -1),
              _buildProgress(
                  "Esneklik", member.athleteProfile?.flexibility ?? -1),
              _buildProgress("Çeviklik", member.athleteProfile?.agility ?? -1),
              const SizedBox(height: 20),
              _buildSectionTitle("Antrenman Geçmişi"),
              const SizedBox(height: 10),
              _buildTrainingHistory(member),
              const SizedBox(height: 20),
              courseButton(context),
              const SizedBox(height: 20),
              _buildApplyTrainingButton(context),
              const SizedBox(height: 10),
              _buildMyApplicationsButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(MemberProfileModel member) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: const Color(0xFF002F7B),
            backgroundImage: member.avatarUrl != null
                ? NetworkImage(member.avatarUrl!)
                : null,
            child: member.avatarUrl == null
                ? const Icon(Icons.person, color: Colors.white, size: 40)
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${member.firstName ?? ""} ${member.lastName ?? ""}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  member.athleteProfile?.sport ?? 'Spor Branşı Bilinmiyor',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  "Yaş: ${member.athleteProfile?.age ?? '--'} | "
                  "Boy: ${member.athleteProfile?.height ?? '--'} cm | "
                  "Kilo: ${member.athleteProfile?.weight ?? '--'} kg",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const ManageAthleteProfileScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF8C42),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        icon: const Icon(Icons.edit, color: Colors.white),
        label: const Text("Sporcu Bilgilerini Güncelle",
            style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildProgress(String title, int value) {
    double progress = value > 0 ? value / 100 : 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          color: const Color(0xFF6B9FFF),
          minHeight: 8,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTrainingHistory(MemberProfileModel member) {
    final history = member.athleteProfile?.trainingHistory ?? [];
    if (history.isEmpty) {
      return const Center(child: Text("Antrenman geçmişi bulunmuyor"));
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: history.length,
      itemBuilder: (context, index) {
        final session = history[index];
        return Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: ListTile(
            leading:
                const Icon(Icons.sports_gymnastics, color: Color(0xFF3C6BC3)),
            title: Text(session.date),
            subtitle: Text(session.focus),
          ),
        );
      },
    );
  }

  Widget _buildApplyTrainingButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => TrainingApplicationScreen()));
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Yeni Antrenmana Başvur",
            style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3C6BC3),
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
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const MyApplicationsScreen()));
        },
        icon: const Icon(Icons.assignment, color: Colors.white),
        label:
            const Text("Başvurularım", style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF8C42),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
