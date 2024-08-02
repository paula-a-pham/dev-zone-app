import 'package:dev_zone/core/constants/app_colors.dart';
import 'package:dev_zone/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.kDarkBlack,
    foregroundColor: Colors.white,
    elevation: 0.0,
    scrolledUnderElevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  brightness: Brightness.dark,
  colorSchemeSeed: AppColors.kPrimaryColor,
  fontFamily: AppStrings.kFontFamily,
  scaffoldBackgroundColor: AppColors.kDarkBlack,
  useMaterial3: true,
);
