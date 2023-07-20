import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimension.dart';
import 'text_styles.dart';

class Themes {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        AppDimension.buttonBorderRadius,
      ),
    ),
    borderSide: BorderSide(
      width: AppDimension.borderWidth,
      color: AppColors.whiteColor,
    ),
  );

  static final ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.whiteGreyColor,
    scaffoldBackgroundColor: AppColors.whiteGreyColor,
    disabledColor: AppColors.greyColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteGreyColor,
      elevation: AppDimension.elevation,
      foregroundColor: AppColors.blackColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppDimension.buttonPadding),
      filled: true,
      focusColor: AppColors.blueColor,
      fillColor: AppColors.whiteColor,
      labelStyle: TextStyles.bodyMedium,
      prefixStyle: TextStyles.bodyMedium,
      hintStyle: TextStyles.bodyMedium,
      errorStyle: TextStyles.bodyMedium,
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder,
      iconColor: AppColors.blackColor,
      prefixIconColor: AppColors.blackColor,
      suffixIconColor: AppColors.blackColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyles.displayLarge,
      displayMedium: TextStyles.displayMedium,
      displaySmall: TextStyles.displaySmall,
      bodyLarge: TextStyles.bodyLarge,
      bodyMedium: TextStyles.bodyMedium,
      bodySmall: TextStyles.bodySmall,
    ),
  );
}
