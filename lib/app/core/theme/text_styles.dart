import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimension.dart';

abstract class TextStyles {
  static const TextStyle displayLarge = TextStyle(
    fontSize: AppDimension.fontDisplayLarge,
    fontWeight: FontWeight.w800,
    color: AppColors.blueColor,
    height: AppDimension.fontDisplayHeight,
  );
  static const TextStyle displayMedium = TextStyle(
    fontSize: AppDimension.fontDisplayMedium,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
    height: AppDimension.fontDisplayHeight,
  );
  static const TextStyle displaySmall = TextStyle(
    fontSize: AppDimension.fontDisplaySmall,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
    height: AppDimension.fontDisplayHeight,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppDimension.fontBodyLarge,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
    height: AppDimension.fontBodyHeight,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppDimension.fontBodyMedium,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    height: AppDimension.fontBodyHeight,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: AppDimension.fontBodySmall,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGreyColor,
    height: AppDimension.fontBodyHeight,
  );
}
