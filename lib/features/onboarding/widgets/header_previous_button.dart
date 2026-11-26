import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderPreviousButton extends StatelessWidget {
  const HeaderPreviousButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: 30.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: AppColors.onPrimaryLight,
          side: const BorderSide(color: AppColors.primaryDark),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        child: Icon(icon, size: 22.sp),
      ),
    );
  }
}