import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socially/core/widgets/badge_icon.dart';
import '../utils/assets_resources.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: BadgeIcon(
          child: SvgPicture.asset(AssetsResources.notificationsIcon),
        ),
        onPressed: () {},
      ),
      title: const Text('SOCIALLY'),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
