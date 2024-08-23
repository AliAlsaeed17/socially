import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socially/core/utils/router.dart';

class StoryCircleAvatar extends StatelessWidget {
  const StoryCircleAvatar({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('${Routes.home}/${Routes.story}'),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        child: ClipPath(
          clipper: DiamondClipper(),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(image: AssetImage(image)),
            ),
          ),
        ),
      ),
    );
  }
}

class DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
