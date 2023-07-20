import 'package:assignment/app/core/theme/app_colors.dart';
import 'package:assignment/app/core/theme/app_dimension.dart';
import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  final Widget widget;
  const CustomBody({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: AppColors.whiteGreyColor,
      padding: const EdgeInsets.all(AppDimension.padding),
      child: SafeArea(
        bottom: false,
        child: widget,
      ),
    );
  }
}
