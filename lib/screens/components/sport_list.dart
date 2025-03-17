import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Sport {
  final int id;
  final String name;
  final String ageGroup;
  final String gender;
  final String trainingDays;

  Sport(
      {required this.id,
      required this.name,
      required this.ageGroup,
      required this.gender,
      required this.trainingDays});
}

Widget SportList(WidgetRef ref) {
  final sportsProvider = Provider<List<Sport>>((ref) {
    return [
      Sport(
          id: 1,
          name: "Basketbol",
          ageGroup: "12-18",
          gender: "Erkek/Kız",
          trainingDays: "Pazartesi-Çarşamba"),
      Sport(
          id: 2,
          name: "Yüzme",
          ageGroup: "10-16",
          gender: "Erkek",
          trainingDays: "Salı-Perşembe"),
      Sport(
          id: 3,
          name: "Tenis",
          ageGroup: "14-20",
          gender: "Kadın",
          trainingDays: "Cuma-Pazar"),
    ];
  });

  final sports = ref.watch(sportsProvider);
  return ListView.builder(
    padding: EdgeInsets.all(16),
    itemCount: sports.length,
    itemBuilder: (context, index) {
      final sport = sports[index];
      return Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Text(sport.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Yaş Grubu: ${sport.ageGroup}"),
              Text("Cinsiyet: ${sport.gender}"),
              Text("Antrenman Günleri: ${sport.trainingDays}"),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("${sport.name} branşı için başvuru alındı!"),
              ));
            },
            child: Text("Başvur"),
          ),
        ),
      );
    },
  );
}
