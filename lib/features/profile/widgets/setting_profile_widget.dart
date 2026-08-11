import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingProfileWidget extends StatelessWidget {
  const SettingProfileWidget({
    super.key, required this.label, required this.settingData, this.onTap,
  });
  final String label , settingData;
 final  VoidCallback?onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
       crossAxisAlignment: .start,
      children: [
       Text(label,style:  theme.listTileTheme.titleTextStyle),
       SizedBox(height: 10.h,),
       ListTile(
        onTap: onTap,
        leading: Text(settingData,style: AppTextStyles.textStyle16),
        
        trailing: Icon(Icons.arrow_drop_down_rounded,
        color: theme.listTileTheme.leadingAndTrailingTextStyle!.color,size: 35,),
        
       ),
      ],
    );
  }
}