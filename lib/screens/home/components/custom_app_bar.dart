import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genclik_spor/screens/home/home_screen.dart';
import 'package:genclik_spor/screens/notification/notification_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: SizedBox(
          height: 56,
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            semanticsLabel: 'Genclik Spor Bakanligi Photo',
            color: context.isDark ? white : offdarkblue,
          ),
        ),
      ),
      backgroundColor: context.isDark ? offdarkblue1 : white,
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.bell),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationScreen()),
            );
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: context.isDark ? Colors.transparent : Colors.grey.shade300,
          height: 1,
        ),
      ),
    );
  }
}
