import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/history/history_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

Widget history(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HistoryScreen(),
        ),
      );
    },
    child: Container(
      height: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            context.isDark ? purple : white,
            context.isDark ? offdarkblue1 : white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: offlightblue2,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tarihçe',
                style: TextStyle(
                  color: offdarkblue1,
                  fontSize: 16,
                ),
              ),
              Text(
                "Gençlik ve Spor Bakanlığı'nın kurulması; 6/4/2011 tarihli ve 6223 sayılı Kanunun verdiği yetkiye dayanılarak, Bakanlar Kurulu'nca 3/6/2011 tarihinde kararlaştırılmıştır.",
                style: TextStyle(
                  color: grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
