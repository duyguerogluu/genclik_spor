import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

ElevatedButton customButton({
  required BuildContext context,
  required VoidCallback onPressed,
  required String text,
  bool isTransparent = false,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: isTransparent
          ? Colors.transparent
          : context.isDark
              ? offlightblue
              : offdarkblue,
      foregroundColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: isTransparent
            ? const Color.fromARGB(255, 217, 217, 217)
            : Colors.white,
      ),
    ),
  );
}
