import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/core/utils/assets_resources.dart';
import 'package:socially/core/utils/number_utils.dart';
import 'package:socially/core/utils/timeago_utils.dart';
import 'package:socially/core/widgets/svg_icon.dart';
import 'package:socially/features/home/presentation/widgets/post_images_section.dart';
import 'package:socially/features/home/presentation/widgets/post_text.dart';
import 'package:socially/features/home/presentation/widgets/tags_secion.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.profileImage,
    required this.profileName,
    this.taggedProfileNames = const [],
    required this.postDate,
    this.tags = const [],
    this.postImages = const [],
    this.postText = '',
    required this.likes,
    required this.comments,
  });

  final String profileImage;
  final DateTime postDate;
  final String profileName;
  final List<String> taggedProfileNames;
  final List<String> tags;
  final List<String> postImages;
  final String postText;
  final int likes;
  final int comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 17.r,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(profileImage),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: profileName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                  ),
                            ),
                            if (taggedProfileNames.isNotEmpty)
                              TextSpan(
                                text: '.With ${taggedProfileNames.join(', ')}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: const Color(0xFF363636),
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                TimeAgo.format(postDate),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color(0x05101C99).withOpacity(0.6)),
              ),
            ],
          ),
          if (postImages.isNotEmpty) PostImagesSection(images: postImages),
          if (postText.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: PostText(text: postText),
            ),
          TagsSection(items: tags),
          const Divider(thickness: 1, color: Color(0xFF363636)),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const SvgIcon(icon: AssetsResources.heartIcon),
                        label: Text(
                          NumberUtils.getFormattedNumberString(
                              likes.toString()),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Flexible(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const SvgIcon(icon: AssetsResources.commentIcon),
                        label: Text(
                          NumberUtils.getFormattedNumberString(
                              comments.toString()),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              IconButton(
                icon: const SvgIcon(icon: AssetsResources.bookmarkIcon),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
