import 'package:assignment/app/core/theme/app_dimension.dart';
import 'package:flutter/material.dart';

class SpaceBox extends StatelessWidget {
  final double size;
  const SpaceBox({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimension.sizedBoxHeight * size,
      height: AppDimension.sizedBoxWidth * size,
    );
  }
}
