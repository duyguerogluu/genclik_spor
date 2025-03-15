import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
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
      backgroundColor: context.isDark ? offlightblue : white,
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.bell),
          onPressed: () {},
        ),
      ],
    );
  }
}
