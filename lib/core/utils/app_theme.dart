import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  /// light theme
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      error: AppColors.logoutLight,
      onError: AppColors.onPrimaryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      iconTheme: IconThemeData(color: AppColors.primaryLight),
      titleTextStyle: TextStyle(color: AppColors.secondaryLight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.r))
        ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: Size(double.infinity, 55.h),
        foregroundColor: AppColors.onPrimaryLight,
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.onPrimaryLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: AppTextStyles.textStyle20.copyWith(
        color: AppColors.onSurfaceLight,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        color: AppColors.titleColorLight,
        fontSize: 30,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.onPrimaryLight,
    ),
  );

  /// dark theme
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      error: AppColors.logoutLight,
      onError: AppColors.onPrimaryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      iconTheme: IconThemeData(color: AppColors.primaryDark),
      titleTextStyle: TextStyle(color: AppColors.secondaryDark),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.r))
        ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: Size(double.infinity, 55.h),
        foregroundColor: AppColors.onPrimaryLight,
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Color(0xff002D8F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: AppTextStyles.textStyle20.copyWith(
        color: AppColors.onPrimaryDark,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        color: AppColors.onPrimaryDark,
        fontSize: 30,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.onPrimaryDark,
    ),
  );
}
