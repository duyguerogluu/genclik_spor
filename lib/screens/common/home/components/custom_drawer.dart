import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genclik_spor/screens/athlete/myapps/my_application_screen.dart';
import 'package:genclik_spor/screens/athlete/profilee/athlete_profile_screen.dart';
import 'package:genclik_spor/screens/common/setting/setting_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.isDark ? offdarkblue1 : white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: darkblue,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                semanticsLabel: 'Gençlik Spor Bakanlığı Logo',
                color: white,
                width: 160,
              ),
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.home,
            text: 'Ana Sayfa',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person,
            text: 'Profilim',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => MemberProfileScreen()));
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.assignment,
            text: 'Başvurularım',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => MyApplicationsScreen()));
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.settings,
            text: 'Ayarlar',
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingsScreen()));
            },
          ),
          const Divider(thickness: 1, color: Colors.grey),
          _buildDrawerItem(
            context,
            icon: Icons.exit_to_app,
            text: 'Çıkış Yap',
            onTap: () {},
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap,
      Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? darkblue),
      title: Text(
        text,
        style: TextStyle(
          color: color ?? (context.isDark ? white : darkblue),
          fontWeight: FontWeight.w500,
        ),
      ),
      hoverColor: context.isDark ? darkblue : Colors.grey[200],
      onTap: onTap,
    );
  }
}
