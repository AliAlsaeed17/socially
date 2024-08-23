import 'package:flutter/material.dart';
import 'package:socially/core/utils/timeago_utils.dart';

class StoryUserInfo extends StatelessWidget {
  const StoryUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Mariano Di Vaio',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextSpan(
            text: '  ${TimeAgo.formatShort(DateTime(2024, 8, 23, 11, 10))}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
