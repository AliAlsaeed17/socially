import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlider extends StatefulWidget {
  const ImagesSlider({super.key, required this.images});

  final List<String> images;

  @override
  State<StatefulWidget> createState() {
    return _ImagesSliderState();
  }
}

class _ImagesSliderState extends State<ImagesSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    widget.images[index],
                    width: constraints.maxWidth,
                    fit: BoxFit.cover,
                  );
                },
                itemCount: widget.images.length,
                carouselController: _controller,
                options: CarouselOptions(
                    height: 300.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(
                        vertical: 8.0.h, horizontal: 4.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key ? Colors.white : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
