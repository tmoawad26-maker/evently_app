import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.accent,
    required this.l10n,
    required this.isDark,
  });

  final Color accent;
  final AppLocalizations l10n;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ?Navigator.canPop(context) ?
        IconButton(
          onPressed: () => Navigator.pop(context),
          tooltip: MaterialLocalizations.of(
            context,
          ).backButtonTooltip,
          icon: const Icon(Icons.arrow_back_ios_new),
          color: accent,
        ):null,
        Expanded(
          child: Text(
            l10n.forgotPasswordTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.authBody.copyWith(
              color: isDark
                  ? AppColors.onSurfaceDark
                  : AppColors.onSurfaceLight,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: 48.w),
      ],
    );
  }
}