import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:socially/core/widgets/image_viewer.dart';

class PostImagesSection extends StatelessWidget {
  const PostImagesSection({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: _buildImagesSection(images),
    );
  }
}

Widget _buildImagesSection(List<String> images) {
  switch (images.length) {
    case 0:
      return const SizedBox.shrink();
    case 1:
      return _buildImage(images[0]);
    case 2:
      return _buildTwoImagesSection(images);
    case 3:
      return _buildThreeImagesSection(images);
    default:
      return ImagesSlider(images: images);
  }
}

Widget _buildImage(String image) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15.r),
    child: Image.asset(image, fit: BoxFit.cover),
  );
}

Widget _buildTwoImagesSection(List<String> images) {
  return StaggeredGrid.count(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: [
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 4,
        child: _buildImage(images[0]),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 4,
        child: _buildImage(images[1]),
      ),
    ],
  );
}

Widget _buildThreeImagesSection(List<String> images) {
  return StaggeredGrid.count(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: [
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 4,
        child: _buildImage(images[0]),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: _buildImage(images[1]),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: _buildImage(images[2]),
      ),
    ],
  );
}
