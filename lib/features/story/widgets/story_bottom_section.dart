import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/core/utils/assets_resources.dart';
import 'package:socially/core/widgets/svg_icon.dart';

class StoryBottomSection extends StatelessWidget {
  const StoryBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.4),
            Colors.transparent,
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {},
          child: const SvgIcon(
            icon: AssetsResources.heartIcon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
