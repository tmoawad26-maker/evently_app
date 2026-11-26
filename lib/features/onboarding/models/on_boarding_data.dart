import 'package:evently_app/core/utils/app_images.dart';

class OnBoardingData {
  const OnBoardingData({
    required this.lightImage,
    required this.darkImage,
    required this.titleKey,
    required this.descriptionKey,
  });

  final String lightImage;
  final String darkImage;
  final String titleKey;
  final String descriptionKey;

  String imageFor(bool isDark) => isDark ? darkImage : lightImage;

  static const pages = [
    OnBoardingData(
      lightImage: AppImages.onBoardingLight1,
      darkImage: AppImages.onBoardingDark1,
      titleKey: 'findEventsTitle',
      descriptionKey: 'findEventsDescription',
    ),
    OnBoardingData(
      lightImage: AppImages.onBoardingLight3,
      darkImage: AppImages.onBoardingPlanning,
      titleKey: 'eventPlanningTitle',
      descriptionKey: 'eventPlanningDescription',
    ),
    OnBoardingData(
      lightImage: AppImages.onBoardingLight4,
      darkImage: AppImages.onBoardingSharing,
      titleKey: 'shareMomentsTitle',
      descriptionKey: 'shareMomentsDescription',
    ),
  ];

  

}
