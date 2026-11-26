import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:evently_app/features/onboarding/widgets/setting_button_widget.dart';
import 'package:evently_app/features/providers/language_provider.dart';
import 'package:evently_app/features/providers/theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnBoardingSettingWidget extends StatelessWidget {
  const OnBoardingSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final selectedColor = isDark ? AppColors.primaryDark : AppColors.primaryLight;
    final unselectedColor = isDark ? AppColors.surfaceDark : AppColors.onPrimaryLight;
    final unselectedTextColor = isDark ? AppColors.onPrimaryDark : AppColors.primaryLight;
    final selectedTextColor = AppColors.onPrimaryLight;
    return Column(
      children: [
        Row(
          children: [
            Text(
              l10n.language,
              style: AppTextStyles.textStyle18.copyWith(
              color: isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
              ),
            ),
            Spacer(),
            SettingButtonWidget(
              onPressed: () =>
                  context.read<LanguageProvider>().changeLanguage('en'),
              textButton: l10n.english,
              buttonBackgroundColor: languageProvider.lang == 'en'
                  ? selectedColor
                  : unselectedColor,
              textColor: languageProvider.lang == 'en'
                  ? selectedTextColor
                  : unselectedTextColor,
            ),
            SizedBox(width: 8.w),
            SettingButtonWidget(
              onPressed: () =>
                  context.read<LanguageProvider>().changeLanguage('ar'),
              textButton: l10n.arabic,
              buttonBackgroundColor: languageProvider.lang == 'ar'
                  ? selectedColor
                  : unselectedColor,
              textColor: languageProvider.lang == 'ar'
                  ? selectedTextColor
                  : unselectedTextColor,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Text(
              l10n.theme,
              style: AppTextStyles.textStyle18.copyWith(
              color: isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
              ),
            ),
            Spacer(),
            SettingButtonWidget(
              onPressed: () =>
                  context.read<ThemeProvider>().setTheme(ThemeMode.light),
              icon: Icons.light_mode,
              buttonBackgroundColor: !isDark ? selectedColor : unselectedColor,
              textColor: !isDark ? selectedTextColor : unselectedTextColor,
              tooltip: l10n.light,
            ),
            SizedBox(width: 8.w),
            SettingButtonWidget(
              onPressed: () =>
                  context.read<ThemeProvider>().setTheme(ThemeMode.dark),
              icon: Icons.dark_mode,
              buttonBackgroundColor: isDark ? selectedColor : unselectedColor,
              textColor: isDark ? selectedTextColor : unselectedTextColor,
              tooltip: l10n.dark,
            ),
          ],
        ),
      ],
    );
  }
}
