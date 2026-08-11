import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/features/profile/widgets/custom_profile_body.dart';
import 'package:evently_app/features/profile/widgets/profile_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 150.h,
        title: ProfileHeaderWidget(),
      ),
      body: CustomProfileBody(),
    );
  }
}


