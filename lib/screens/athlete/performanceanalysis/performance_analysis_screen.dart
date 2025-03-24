import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PerformanceAnalysisScreen extends StatefulWidget {
  const PerformanceAnalysisScreen({super.key});

  @override
  State<PerformanceAnalysisScreen> createState() =>
      _PerformanceAnalysisScreenState();
}

class _PerformanceAnalysisScreenState extends State<PerformanceAnalysisScreen> {
  String filter = 'Haftalık';
  String target = '';
  List<PerformanceData> data = [
    PerformanceData('Hafta 1', 60),
    PerformanceData('Hafta 2', 75),
    PerformanceData('Hafta 3', 90),
    PerformanceData('Hafta 4', 85),
  ];

  Future<void> _generatePdf() async {
    final PdfDocument document = PdfDocument();
    final page = document.pages.add();
    page.graphics.drawString(
        'Performans Raporu', PdfStandardFont(PdfFontFamily.helvetica, 18));

    for (var d in data) {
      page.graphics.drawString('${d.period}: ${d.score} puan',
          PdfStandardFont(PdfFontFamily.helvetica, 12),
          bounds: Rect.fromLTWH(0, 50 + data.indexOf(d) * 20, 500, 20));
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/performans_raporu.pdf');
    await file.writeAsBytes(await document.save());
    document.dispose();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('PDF Kaydedildi: ${file.path}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Performans Analizi')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: filter,
                  items: ['Haftalık', 'Aylık']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => filter = val!),
                ),
                ElevatedButton(
                  onPressed: _generatePdf,
                  child: const Text('PDF İndir'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Hedef Belirle (örn: 95 puan)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => target = val,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Performans Gelişimi'),
                series: <CartesianSeries>[
                  LineSeries<PerformanceData, String>(
                    dataSource: data,
                    xValueMapper: (PerformanceData d, _) => d.period,
                    yValueMapper: (PerformanceData d, _) => d.score,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerformanceData {
  final String period;
  final double score;

  PerformanceData(this.period, this.score);
}
