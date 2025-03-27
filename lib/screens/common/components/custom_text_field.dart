import 'package:flutter/material.dart';
import 'package:genclik_spor/utils/colors.dart';

Widget customTextField({
  required TextEditingController controller,
  required String hintText,
  required bool obscureText,
  required Function() onVisibilityToggle,
  required bool isDark,
}) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: isDark ? offdarkblue : white1,
      border: Border(
        bottom: BorderSide(
          color: offlightblue2,
        ),
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.transparent,
          blurRadius: 20.0,
          offset:  Offset(0, 10),
        ),
      ],
    ),
    child: TextFormField(
      controller: controller,
      cursorColor: Colors.purpleAccent,
      obscureText: obscureText,
      style: TextStyle(color: isDark ? white : black),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? offdarkblue : white1,
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black45),
        suffixIcon: obscureText
            ? IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: onVisibilityToggle,
              )
            : null,
      ),
    ),
  );
}
