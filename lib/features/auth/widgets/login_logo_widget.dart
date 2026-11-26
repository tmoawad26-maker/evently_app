import 'package:evently_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginLogoWidget extends StatelessWidget {
  const LoginLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Image.asset(
        isDark ? AppImages.imagesEventlyLogoDark : AppImages.imagesEventlyLogo,
        width: 132.w,
        height: 30.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
