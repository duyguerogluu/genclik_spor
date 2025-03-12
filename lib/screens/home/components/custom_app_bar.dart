import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Ana Sayfa'),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        ),
      ],
    );
  }
}

class ProfileScreen {
  const ProfileScreen();
}
