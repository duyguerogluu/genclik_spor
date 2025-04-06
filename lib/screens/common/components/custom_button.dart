import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

ElevatedButton customButton({
  required BuildContext context,
  required VoidCallback onPressed,
  required String text,
  Icon? icon,
  bool isTransparent = false,
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: icon ?? const SizedBox.shrink(),
    label: Text(
      text,
      style: TextStyle(
        color: isTransparent
            ? const Color.fromARGB(255, 217, 217, 217)
            : Colors.white,
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: isTransparent
          ? Colors.transparent
          : context.isDark
              ? offlightblue
              : offlightblue,
      foregroundColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
