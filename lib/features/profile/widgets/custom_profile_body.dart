
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/profile/widgets/setting_profile_widget.dart';
import 'package:evently_app/features/providers/language_provider.dart';
import 'package:evently_app/features/providers/theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomProfileBody extends StatefulWidget {
  const CustomProfileBody({super.key});

  @override
  State<CustomProfileBody> createState() => _CustomProfileBodyState();
}

class _CustomProfileBodyState extends State<CustomProfileBody> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var themeProvider =  context.read<ThemeProvider>();
    String textTheme = locale!.light;
    return  Padding(
      padding:  EdgeInsets.only(top: 32.0.r,left: 16.r,right: 16.r),
      child: Column(
        children: [
          SettingProfileWidget(label: AppLocalizations.of(context)!.language,
            onTap: context.read<LanguageProvider>().changeLanguage,
            settingData: locale!.arabic),
          SizedBox(height: 16.h,),
          SettingProfileWidget(label: AppLocalizations.of(context)!.theme,
            settingData:  textTheme,onTap: () {
            context.read<ThemeProvider>().toggleTheme();
            // themeProvider.changeTextMode(context);
            changeTextTheme(textTheme: textTheme, themeMode: themeProvider.themeMode);
            },
          ),
          Spacer(),
          CustomElevatedButton(textButton: locale!.logout, onPressed: (){}, backgroundButton: AppColors.logoutLight),
          SizedBox(height: 32.h,),
        ],
      )
    );
  }
   changeTextTheme({required String textTheme ,required ThemeMode themeMode}) {
    textTheme =  themeMode.isLight ? AppLocalizations.of(context)!.light :
        AppLocalizations.of(context)!.dark;
        setState(() {

        });
  }
}

