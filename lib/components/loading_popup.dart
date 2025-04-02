import 'package:flutter/material.dart';

import '../main.dart';

void loadingPopup() {
  showDialog(
    context: MyApp.navigatorKey.currentContext!,
    builder: (_) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
