import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class PerformanceAnalysisScreen extends StatelessWidget {
  const PerformanceAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final performanceData = [
      {
        'name': 'Ali Yılmaz',
        'branch': 'Basketbol',
        'trainings': 12,
        'attendance': 85,
        'progress': 20,
      },
      {
        'name': 'Ayşe Demir',
        'branch': 'Voleybol',
        'trainings': 10,
        'attendance': 90,
        'progress': 25,
      },
      {
        'name': 'Mehmet Kaya',
        'branch': 'Yüzme',
        'trainings': 15,
        'attendance': 80,
        'progress': 30,
      },
    ];

    return Scaffold(
      backgroundColor: context.isDark ? offdarkblue : white1,
      appBar: AppBar(
        title: const Text("Performans Analizi",
            style: TextStyle(color: Colors.white)),
        backgroundColor: darkblue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...performanceData.map((data) => Card(
                color: white,
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['name'].toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Branş: ${data['branch']}'),
                      Text('Toplam Antrenman: ${data['trainings']}'),
                      Text('Katılım Oranı: %${data['attendance']}'),
                      Text('Gelişim: %${data['progress']}'),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: (data['progress'] as int) / 100,
                        color: Colors.green,
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 32),
          Text("Genel Gelişim Grafiği",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: darkblue)),
          const SizedBox(height: 16),
          SizedBox(
            height: 250,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                backgroundColor: Colors.white,
                borderData: FlBorderData(show: false),
                barGroups: performanceData.asMap().entries.map((entry) {
                  int index = entry.key;
                  var data = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: (data['progress'] as int).toDouble(),
                        color: Colors.blueAccent,
                        width: 22,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final name =
                            (performanceData[value.toInt()]['name'] as String)
                                .split(' ')[0];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child:
                              Text(name, style: const TextStyle(fontSize: 12)),
                        );
                      },
                    ),
                  ),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
