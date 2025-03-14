import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  Brightness get themeType => Theme.of(this).brightness;

  bool get isDark => themeType == Brightness.dark;
}
