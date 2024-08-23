import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socially/core/utils/assets_resources.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        AssetsResources.bookmarkIcon,
        colorFilter:
            const ColorFilter.mode(Color(0xFF363636), BlendMode.srcATop),
      ),
      onPressed: () {},
    );
  }
}
