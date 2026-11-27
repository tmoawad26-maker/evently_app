import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  // ---------------------------------------------------------------------------
  // Light theme
  // ---------------------------------------------------------------------------
  static ThemeData get light {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.surfaceLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
      error: AppColors.errorColor,
      onError: AppColors.onPrimaryLight,
    );

    return _build(
      colorScheme: colorScheme,
      scaffoldBackground: AppColors.scaffoldBackgroundColorLight,
      appBarBackground: AppColors.appBarLight,
      titleColor: AppColors.titleColorLight,
      bodyColor: AppColors.onSurfaceLight,
      mutedColor: AppColors.authMutedLight,
      fabColor: AppColors.floatingActionButtonLight,
      selectedNavColor: AppColors.selectNavButtonLight,
      unselectedNavColor: AppColors.unSelectNavButtonDark,
      inputFill: AppColors.authInputFillLight,
      inputBorder: AppColors.authInputBorder,
    );
  }

  // ---------------------------------------------------------------------------
  // Dark theme
  // ---------------------------------------------------------------------------
  static ThemeData get dark {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.scaffoldBackgroundColorDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      error: AppColors.errorColor,
      onError: AppColors.onPrimaryDark,
    );

    return _build(
      colorScheme: colorScheme,
      scaffoldBackground: AppColors.scaffoldBackgroundColorDark,
      appBarBackground: AppColors.appBarDark,
      titleColor: AppColors.authTitleDark,
      bodyColor: AppColors.onSurfaceDark,
      mutedColor: AppColors.onboardingSubtitleDark,
      fabColor: AppColors.floatingActionButtonDark,
      selectedNavColor: AppColors.selectNavButtonDark,
      unselectedNavColor: AppColors.unSelectNavButtonDark,
      inputFill: AppColors.surfaceDark,
      inputBorder: AppColors.unSelectIconColorDark,
    );
  }

  // ---------------------------------------------------------------------------
  // Shared builder
  // ---------------------------------------------------------------------------
  static ThemeData _build({
    required ColorScheme colorScheme,
    required Color scaffoldBackground,
    required Color appBarBackground,
    required Color titleColor,
    required Color bodyColor,
    required Color mutedColor,
    required Color fabColor,
    required Color selectedNavColor,
    required Color unselectedNavColor,
    required Color inputFill,
    required Color inputBorder,
  }) {
    final textTheme = _textTheme(
      titleColor: titleColor,
      bodyColor: bodyColor,
      mutedColor: mutedColor,
    );

    OutlineInputBorder border(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: bodyColor),
        titleTextStyle: AppTextStyles.appBarTitle.copyWith(
          color: bodyColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: fabColor,
        foregroundColor: AppColors.onPrimaryLight,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appBarBackground,
        selectedItemColor: selectedNavColor,
        unselectedItemColor: unselectedNavColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: AppTextStyles.authButton,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: AppTextStyles.authBody.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        hintStyle: AppTextStyles.authHint.copyWith(color: mutedColor),
        errorStyle: AppTextStyles.authHint.copyWith(
          color: AppColors.errorColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: border(inputBorder),
        enabledBorder: border(inputBorder),
        focusedBorder: border(colorScheme.primary),
        errorBorder: border(AppColors.errorColor),
        focusedErrorBorder: border(AppColors.errorColor),
      ),
      dividerTheme: DividerThemeData(color: inputBorder, thickness: 1),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  static TextTheme _textTheme({
    required Color titleColor,
    required Color bodyColor,
    required Color mutedColor,
  }) {
    return TextTheme(
      // Headings
      headlineMedium: AppTextStyles.textStyle24.copyWith(color: titleColor),
      headlineSmall: AppTextStyles.textStyle20.copyWith(color: titleColor),
      titleLarge: AppTextStyles.textStyle18.copyWith(color: bodyColor),
      titleMedium: AppTextStyles.textStyle16.copyWith(color: bodyColor),
      titleSmall: AppTextStyles.textStyle14.copyWith(
        color: bodyColor,
        fontWeight: FontWeight.w600,
      ),
      // Body
      bodyLarge: AppTextStyles.textStyle16.copyWith(
        color: bodyColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: AppTextStyles.textStyle14.copyWith(color: bodyColor),
      bodySmall: AppTextStyles.authHint.copyWith(color: mutedColor),
      // Labels
      labelLarge: AppTextStyles.authButton.copyWith(
        color: bodyColor,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: AppTextStyles.authDivider.copyWith(color: mutedColor),
      labelSmall: AppTextStyles.textStyle12SemiBold.copyWith(color: mutedColor),
    );
  }
}