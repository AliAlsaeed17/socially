import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socially/core/utils/assets_resources.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0.r),
          topRight: Radius.circular(30.0.r),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsResources.homeIcon,
                height: 30.h,
                width: 30.w,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcATop),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsResources.navigationIcon,
                height: 30.h,
                width: 30.w,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcATop),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsResources.profileIcon,
                height: 30.h,
                width: 30.w,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcATop),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
