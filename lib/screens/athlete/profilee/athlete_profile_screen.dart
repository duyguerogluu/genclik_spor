import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/models/member_profile_model.dart';
import 'package:genclik_spor/riverpod/riverpod_management.dart';
import 'package:genclik_spor/screens/athlete/myapps/my_application_screen.dart';
import 'package:genclik_spor/screens/athlete/profilee/components/athlete_informatin_button.dart';
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
      body: Stack(
        children: [
          Container(color: context.isDark ? offdarkblue : orange),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: _buildProfileCard(read),
          ),
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildSquareButton(
                              context, athleteInformationButton(context)),
                          const SizedBox(width: 16),
                          _buildSquareButton(context, courseButton(context)),
                          const SizedBox(width: 16),
                          _buildSquareButton(
                              context, _buildApplyButton(context)),
                          const SizedBox(width: 16),
                          _buildSquareButton(
                              context, _buildMyApplicationsButton(context)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTrainingHistory(read),
                    const SizedBox(height: 20),
                    _buildPerformanceAnalysis(read),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Üye Profili",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Icon(Icons.edit, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceAnalysis(MemberProfileModel read) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Performans Analizi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildProgressBar("Dayanıklılık", read.athleteProfile?.endurance ?? -1),
        _buildProgressBar("Hız", read.athleteProfile?.speed ?? -1),
        _buildProgressBar("Esneklik", read.athleteProfile?.flexibility ?? -1),
        _buildProgressBar("Çeviklik", read.athleteProfile?.agility ?? -1),
      ],
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

  Widget _buildApplyButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrainingApplicationScreen(),
            ),
          );
        },
        label: Text("Yeni Antrenman", style: TextStyle(color: white)),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: offlightblue1,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(MemberProfileModel member) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
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
          const SizedBox(height: 16),
          Text(
            "${member.firstName ?? ""} ${member.lastName ?? ""}",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            member.athleteProfile?.sport ?? 'Spor Branşı Bilinmiyor',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            "Yaş: ${member.athleteProfile?.age ?? '--'} | "
            "Boy: ${member.athleteProfile?.height ?? '--'} cm | "
            "Kilo: ${member.athleteProfile?.weight ?? '--'} kg",
            style: const TextStyle(fontSize: 14, color: Colors.white),
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
          elevation: 0,
          backgroundColor: offlightblue1,
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
        label: Text("Başvuruları Görüntüle",
            style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: offlightblue1,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildSquareButton(BuildContext context, Widget child) {
    double boxWidth = (MediaQuery.of(context).size.width - 24) / 3;
    return SizedBox(
      width: boxWidth,
      height: 100,
      child: Card(
        color: offlightblue1,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: child),
      ),
    );
  }
}
