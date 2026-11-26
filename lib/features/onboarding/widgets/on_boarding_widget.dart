import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/routing/routes.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:evently_app/features/onboarding/models/on_boarding_data.dart';
import 'package:evently_app/features/onboarding/widgets/custom_smooth_indicator.dart';
import 'package:evently_app/features/onboarding/widgets/header_previous_button.dart';
import 'package:evently_app/features/onboarding/widgets/on_boarding_setting_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({super.key});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, RouteName.loginRoute);
  }

  void _nextPage() {
    if (_pageIndex == OnBoardingData.pages.length - 1) {
      _goToLogin();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    if (_pageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    }
  }

  String _localizedText(AppLocalizations l10n, String key) => switch (key) {
    'findEventsTitle' => l10n.findEventsTitle,
    'findEventsDescription' => l10n.findEventsDescription,
    'eventPlanningTitle' => l10n.eventPlanningTitle,
    'eventPlanningDescription' => l10n.eventPlanningDescription,
    'shareMomentsTitle' => l10n.shareMomentsTitle,
    _ => l10n.shareMomentsDescription,
  };
  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isLastPage = _pageIndex == OnBoardingData.pages.length - 1;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceLight;
    final mutedColor = isDark ? AppColors.onboardingSubtitleDark : AppColors.onSecondaryLight;
    final accentColor = isDark ? AppColors.primaryDark : AppColors.primaryLight;

    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: SafeArea(
        minimum: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
        child: Column(
          children: [
              SizedBox(
                height: 44.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      isDark ? AppImages.imagesEventlyLogoDark : AppImages.imagesEventlyLogo,
                      width: 132.w,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _pageIndex == 0
                          ? const SizedBox(width: 32)
                          : HeaderPreviousButton(icon: Icons.chevron_left, onPressed: _previousPage),
                    ),
                    if (!isLastPage)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _goToLogin,
                          style: TextButton.styleFrom(
                            foregroundColor: titleColor,
                            side: BorderSide(color: accentColor),
                            minimumSize: Size(54.w, 30.h),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(l10n.skip),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: OnBoardingData.pages.length,
                  onPageChanged: (index) => setState(() => _pageIndex = index),
                  itemBuilder: (context, index) {
                    final page = OnBoardingData.pages[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4.w, 8.h, 4.w, 4.h),
                            child: Image.asset(
                              page.imageFor(isDark),
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        CustomSmoothIndicator(pages: OnBoardingData.pages, pageIndex: _pageIndex),
                        SizedBox(height: 14.h),
                        Text(
                          _localizedText(l10n, page.titleKey),
                          style: AppTextStyles.textStyle16.copyWith(
                            color: titleColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          _localizedText(l10n, page.descriptionKey),
                          style: AppTextStyles.textStyle14.copyWith(
                            color: mutedColor,
                            height: 1.42,
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 12.h),
              const OnBoardingSettingWidget(),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                height: 44.h,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: AppColors.onPrimaryLight,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(isLastPage ? l10n.getStarted : l10n.next),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
