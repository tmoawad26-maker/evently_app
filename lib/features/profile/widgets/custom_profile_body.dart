
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/profile/widgets/setting_profile_widget.dart';
import 'package:evently_app/features/providers/theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomProfileBody extends StatelessWidget {
  const CustomProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final themeProvider = context.watch<ThemeProvider>();
    final logoutColor = theme.colorScheme.error;
    final themeName = themeProvider.themeMode == ThemeMode.light
        ? localizations.light
        : localizations.dark;

    return Padding(
      padding: EdgeInsets.only(top: 32.r, left: 16.r, right: 16.r),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SettingProfileWidget(
                    label: localizations.language,
                    settingData: localizations.arabic,
                  ),
                  SizedBox(height: 16.h),
                  SettingProfileWidget(
                    label: localizations.theme,
                    settingData: themeName,
                    onTap: () {
                      context.read<ThemeProvider>().toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
            textButton: localizations.logout,
            onPressed: () {},
            backgroundButton: logoutColor,
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

