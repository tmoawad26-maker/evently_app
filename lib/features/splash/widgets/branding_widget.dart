import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandingWidget extends StatelessWidget {
  const BrandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.imagesrouteLight),
        SizedBox(height: 8.h),
        Text(
          'Supervised by Mohamed Nabil',
          style: AppTextStyles.textStyle14.copyWith(
            color: AppColors.onSurfaceLight,
          ),
        ),
      ],
    );
  }
}
