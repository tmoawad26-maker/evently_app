

import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.textButton, this.backgroundButton, required this.onPressed,
  });
    final String textButton ;
    final Color? backgroundButton;
    final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundButton ?? AppColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
       fixedSize: Size(width, 55.h),
      ),
      child: Text(
        textButton,
        style: AppTextStyles.textStyle20.copyWith(
          color: AppColors.onPrimaryLight,
        ),
      ),
    );
  }
}