import 'package:animate_do/animate_do.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/features/splash/widgets/branding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSplashScreenBody extends StatelessWidget {
  const CustomSplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print('Height of Screen = $height');
    print('Width of Screen = $width');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
          Padding(
            padding:  EdgeInsets.only(left: 33.0.r, right: 33.0.r),
            child: ZoomIn(
              duration: Duration(seconds: 2),
              child: Image.asset(AppImages.imagesEventlyLogo)),
          ),
          Spacer(),
        //  Expanded(child: SizedBox(),),
          FadeInUp(
            delay: Duration(seconds: 2),
            onFinish: (direction) {
              navigateToMainLayout(context);
            },
            child: BrandingWidget()),
          SizedBox(height: 64.h,),
      ],
    );

  }

  void navigateToMainLayout(BuildContext context) {
     Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRoutes.mainLayoutRoute);
    });
  }
}
