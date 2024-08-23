// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/core/utils/assets_resources.dart';
import 'package:socially/features/home/presentation/widgets/story_circle_avatar.dart';

class StoriesSection extends StatelessWidget {
  StoriesSection({super.key});

  List<String> users = [
    AssetsResources.firstUserImage,
    AssetsResources.secondUserImage,
    AssetsResources.thirdUserImage,
    AssetsResources.fourthUserImage,
    AssetsResources.fifthUserImage,
    AssetsResources.sixthUserImage,
    AssetsResources.seventhUserImage,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 9,
            spreadRadius: 0,
            color: Color(0x0000001A),
          ),
        ],
        gradient: const LinearGradient(
          colors: [Color(0x435A734D), Color(0x182A3E4D)],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return StoryCircleAvatar(image: users[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: users.length,
        ),
      ),
    );
  }
}
