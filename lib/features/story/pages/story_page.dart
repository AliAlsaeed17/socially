import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:socially/core/bloc/timer/timer_cubit.dart';
import 'package:socially/core/utils/assets_resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially/features/story/widgets/story_bottom_section.dart';
import 'package:socially/features/story/widgets/story_progress_bar.dart';
import 'package:socially/features/story/widgets/story_top_bar.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    context.read<TimerCubit>().startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerCubit, double>(
      listener: (context, state) {
        if (state >= 1.0) {
          context.pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: ScreenUtil().screenHeight,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AssetsResources.postImage,
                    fit: BoxFit.fill,
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        StoryProgressBar(),
                        StoryTopBar(),
                      ],
                    ),
                    StoryBottomSection(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
