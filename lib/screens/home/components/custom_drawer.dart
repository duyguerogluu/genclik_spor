import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text('Başlık', style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
              color: Color.fromRGBO(143, 148, 251, 1),
            ),
          ),
          ListTile(
            title: const Text('Ana Sayfa'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Ayarlar'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}