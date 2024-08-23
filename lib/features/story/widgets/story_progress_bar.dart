import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/core/bloc/timer/timer_cubit.dart';

class StoryProgressBar extends StatelessWidget {
  const StoryProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, double>(
      builder: (context, progress) {
        return LinearProgressIndicator(
          minHeight: 5.h,
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation<Color>(
            Colors.blue,
          ),
          value: progress,
        );
      },
    );
  }
}
