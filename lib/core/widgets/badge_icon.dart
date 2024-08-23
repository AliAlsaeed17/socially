import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  const BadgeIcon({
    super.key,
    required this.child,
    this.badge,
    this.width = 24,
    this.height = 24,
    this.alignment = AlignmentDirectional.topEnd,
  });

  final Widget child;
  final Widget? badge;
  final double width;
  final double height;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Center(child: child),
          Align(alignment: alignment, child: badge)
        ],
      ),
    );
  }
}
