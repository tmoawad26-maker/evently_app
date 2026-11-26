import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_images.dart';

class OnBoardingHeaderWidget extends StatelessWidget {
  const OnBoardingHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(alignment: .center,child: Padding(
      padding:  EdgeInsets.only(top: 16.h),
      child: Image.asset(
        isDark ? AppImages.imagesEventlyLogoDark : AppImages.imagesEventlyLogo,
        width: 142.w,
      ),
    ));
  }
}
