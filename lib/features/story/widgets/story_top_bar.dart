import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:socially/core/utils/assets_resources.dart';
import 'package:socially/core/widgets/svg_icon.dart';
import 'package:socially/features/story/widgets/story_user_info.dart';

class StoryTopBar extends StatelessWidget {
  const StoryTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.4),
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                InkWell(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                const Flexible(child: StoryUserInfo()),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {},
            child: const SvgIcon(
              icon: AssetsResources.downloadIcon,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
