import 'package:flutter/material.dart';
import '../utils/assets_resources.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Image.asset(
            AssetsResources.heartIcon,
            height: 200,
            width: 200,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          message ?? 'No Data Found',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
