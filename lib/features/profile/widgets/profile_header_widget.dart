import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 116.w,
          height: 116.h,
          decoration: BoxDecoration(
            color: AppColors.onPrimaryLight,
            image: DecorationImage(
              image: AssetImage(AppImages.imagesRouteLogo),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100.r),
              topRight: Radius.circular(100.r),
              bottomLeft: Radius.circular(100.r),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          children: [
            Text(
              'John Safwat',
              style: AppTextStyles.textStyle20.copyWith(
                color: AppColors.onPrimaryLight,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'JohnSafwat@gamil.com',
              style: AppTextStyles.textStyle16.copyWith(
                color: AppColors.onPrimaryLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
