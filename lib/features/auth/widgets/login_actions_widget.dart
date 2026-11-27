import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForgotPasswordLink extends StatelessWidget {
  const LoginForgotPasswordLink({
    required this.label,
    required this.color,
    required this.onPressed,
    super.key,
  });

  final String label;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        minimumSize: Size(0, 32.h),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(label, style: AppTextStyles.textStyle12SemiBold.copyWith(fontSize: 12.sp)),
    ),
  );
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.label, required this.onPressed, super.key, required this.isLoading});

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 46.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? AppColors.primaryDark : AppColors.primaryLight,
          foregroundColor: AppColors.onPrimaryLight,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.r)),
        ),
        child: isLoading ?
        Center(child: CircularProgressIndicator(color: AppColors.onPrimaryLight,),)
        :
        Text(label, style: AppTextStyles.authButton.copyWith(fontSize: 16.sp)),
      ),
    );
  }
}

class LoginSignupLink extends StatelessWidget {
  const LoginSignupLink({
    required this.prompt,
    required this.label,
    required this.promptColor,
    required this.actionColor,
    required this.onPressed,
    super.key,
  });

  final String prompt;
  final String label;
  final Color promptColor;
  final Color actionColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Center(
    child: Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(prompt, style: AppTextStyles.authHint.copyWith(color: promptColor, fontSize: 12.sp)),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: actionColor,
            padding: EdgeInsetsDirectional.only(start: 3.w),
            minimumSize: Size(0, 32.h),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(label, style: AppTextStyles.textStyle12SemiBold.copyWith(fontSize: 12.sp)),
        ),
      ],
    ),
  );
}

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    required this.label,
    required this.color,
    required this.lineColor,
    super.key,
  });

  final String label;
  final Color color;
  final Color lineColor;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: Divider(color: lineColor, thickness: 0.7)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Text(label, style: AppTextStyles.authDivider.copyWith(color: color, fontSize: 13.sp)),
      ),
      Expanded(child: Divider(color: lineColor, thickness: 0.7)),
    ],
  );
}

class LoginGoogleButton extends StatelessWidget {
  const LoginGoogleButton({
    required this.label,
    required this.isDark,
    required this.borderColor,
    required this.onPressed,
    super.key,
  });

  final String label;
  final bool isDark;
  final Color borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 44.h,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark ? AppColors.primaryDark : AppColors.primaryLight,
        backgroundColor: isDark ? AppColors.transparent : AppColors.authInputFillLight,
        side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.googleIc,
            width: 23.r,
            height: 23.r,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 12.w),
          Text(label, style: AppTextStyles.authBody.copyWith(fontSize: 14.sp)),
        ],
      ),
    ),
  );
}
