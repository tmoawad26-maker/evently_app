import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/features/onboarding/models/on_boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({
    super.key,
    required this._pages,
    required this._pageIndex,
  });

  final List<OnBoardingData> _pages;
  final int _pageIndex;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (dotIndex) => AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          width: dotIndex == _pageIndex ? 16.w : 6.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: dotIndex == _pageIndex
                ? (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                : (isDark
                    ? AppColors.unSelectNavButtonDark
                    : AppColors.unSelectNavButtonDark),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }
}
