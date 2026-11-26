import 'package:animate_do/animate_do.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/routing/routes.dart';
import 'package:evently_app/features/splash/widgets/branding_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSplashScreenBody extends StatelessWidget {
  const CustomSplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              navigateToOnBoardingScreen(context);
            },
            child: BrandingWidget()),
          SizedBox(height: 64.h,),
      ],
    );

  }

  void navigateToOnBoardingScreen(BuildContext context) {
     Future.delayed(Duration(seconds: 1), () {
      if(!context.mounted) return;
        if(FirebaseAuth.instance.currentUser == null){
          Navigator.pushReplacementNamed(context, RouteName.onBoardingRoute);
        }else {
          Navigator.pushNamed(context, RouteName.mainLayoutRoute);
        }
    });
  }
}
