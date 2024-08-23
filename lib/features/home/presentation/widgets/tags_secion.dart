import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/core/utils/assets_resources.dart';
import 'package:socially/core/widgets/svg_icon.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;
        double usedWidth = 0;
        int visibleItems = 0;
        double spacing = 8.w;
        List<Widget> visibleWidgets = [];
        for (int i = 0; i < items.length; i++) {
          final textWidth = _measureTextWidth(context, items[i]);
          if (usedWidth + textWidth + spacing > availableWidth) {
            break;
          }
          visibleItems++;
          usedWidth += textWidth + spacing;
          visibleWidgets.add(_buildItem(context, items[i]));
        }
        if (visibleItems < items.length) {
          int remainingItems = items.length - visibleItems;
          visibleWidgets.add(_buildRemainingCount(context, remainingItems));
        }
        return Row(
          children: visibleWidgets,
        );
      },
    );
  }

  double _measureTextWidth(BuildContext context, String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontSize: 16.sp)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width + 20;
  }

  Widget _buildItem(BuildContext context, String item) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(right: 5.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: TextButton.icon(
            onPressed: () {},
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color(0xFFF1F1F1),
              ),
            ),
            icon: const SvgIcon(icon: AssetsResources.purchaseIcon),
            label: AutoSizeText(
              item,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRemainingCount(BuildContext context, int remainingCount) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Color(0xFFF1F1F1),
          ),
        ),
        child: AutoSizeText(
          '+$remainingCount',
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
