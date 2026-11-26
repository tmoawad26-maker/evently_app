
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/profile/widgets/setting_profile_widget.dart';
import 'package:evently_app/features/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomProfileBody extends StatelessWidget {
  const CustomProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 32.0.r,left: 16.r,right: 16.r),
      child: Column(
        children: [
          SettingProfileWidget(label: 'Language',settingData: 'Arabic',),
          SizedBox(height: 16.h,),
          SettingProfileWidget(label: 'Theme',settingData: context.watch<ThemeProvider>().
          textThemeMode,onTap: () {
            context.read<ThemeProvider>().toggleTheme();
            context.read<ThemeProvider>().changeTextMode(context);
          },
          ),
          Spacer(),
          CustomElevatedButton(textButton: 'Logout', onPressed: (){}, 
          backgroundButton: AppColors.logoutLight),
          SizedBox(height: 32.h,),
        ],
      )
    );
  }
}

