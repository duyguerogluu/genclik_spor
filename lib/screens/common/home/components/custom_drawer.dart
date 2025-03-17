import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.isDark ? offdarkblue1 : white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: offdarkblue,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.1,
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                semanticsLabel: 'Genclik Spor Bakanligi Photo',
                color: white,
              ),
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
