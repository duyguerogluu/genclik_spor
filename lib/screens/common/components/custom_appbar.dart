import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';

AppBar customAppBar(String title) {
  return AppBar(
    backgroundColor: offlightblue,
    title: Text(title, style: const TextStyle(color: Colors.white)),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
