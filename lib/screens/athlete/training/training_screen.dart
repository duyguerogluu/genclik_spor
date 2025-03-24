import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/athlete/training/training_detail_screen.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class TrainingsScreen extends StatelessWidget {
  const TrainingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pastTrainings = [
      {
        'date': '12 Mart 2025',
        'branch': 'Basketbol',
        'gym': 'Nevin Yanıt Spor Salonu',
        'coach': 'Ahmet Yılmaz'
      },
      {
        'date': '15 Mart 2025',
        'branch': 'Voleybol',
        'gym': 'Adnan Menderes Spor Kompleksi',
        'coach': 'Mehmet Demir'
      },
    ];

    final upcomingTrainings = [
      {
        'date': '22 Mart 2025',
        'branch': 'Yüzme',
        'gym': 'Olimpik Yüzme Havuzu',
        'coach': 'Fatma Kaya'
      },
      {
        'date': '25 Mart 2025',
        'branch': 'Atletizm',
        'gym': 'Stadyum',
        'coach': 'Ali Can'
      },
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.isDark ? offdarkblue : white1,
        appBar: customAppBar('Antrenmanlarım'),
        body: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Geçmiş'),
                Tab(text: 'Yaklaşan'),
              ],
              labelColor: darkblue,
              indicatorColor: darkblue,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTrainingList(context, pastTrainings, isPast: true),
                  _buildTrainingList(context, upcomingTrainings),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrainingList(
      BuildContext context, List<Map<String, String>> trainings,
      {bool isPast = false}) {
    if (trainings.isEmpty) {
      return const Center(child: Text('Antrenman bulunamadı.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: trainings.length,
      itemBuilder: (context, index) {
        final training = trainings[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TrainingDetailScreen(training: training)),
            );
          },
          child: Card(
            color: white,
            margin: const EdgeInsets.only(bottom: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.fitness_center, color: darkblue),
              title: Text('${training['branch']} - ${training['date']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Salon: ${training['gym']}'),
                  Text('Antrenör: ${training['coach']}'),
                ],
              ),
              trailing: isPast
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.access_time, color: Colors.orange),
            ),
          ),
        );
      },
    );
  }
}
