import 'package:flutter/material.dart';

class PostText extends StatelessWidget {
  final String text;

  const PostText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final RegExp regExp = RegExp(r'(@\w+)');
    final List<TextSpan> spans = [];

    text.splitMapJoin(
      regExp,
      onMatch: (match) {
        spans.add(
          TextSpan(
            text: match.group(0),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        );
        return '';
      },
      onNonMatch: (nonMatch) {
        spans.add(TextSpan(
            text: nonMatch, style: Theme.of(context).textTheme.bodyMedium!));
        return '';
      },
    );
    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
