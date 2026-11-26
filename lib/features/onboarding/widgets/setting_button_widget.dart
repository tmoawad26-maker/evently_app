import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({
    super.key,
    required this.onPressed,
    this.textButton,
    this.textColor,
    this.buttonBackgroundColor,
    this.icon,
    this.tooltip,
  }) : assert(
         (textButton != null) != (icon != null),
         'Please enter text or icon',
       );
  final VoidCallback onPressed;
  final String? textButton;
  final IconData? icon;
  final String? tooltip;
  final Color? textColor, buttonBackgroundColor;
  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: textColor ?? AppColors.primaryLight,
        backgroundColor: buttonBackgroundColor ?? AppColors.onPrimaryLight,
      ),
      child: textButton != null
          ? Text(textButton!, style: AppTextStyles.textStyle14)
          : Icon(
              icon!,
              color: textColor ?? AppColors.primaryLight,
              semanticLabel: tooltip,
            ),
    );
    return tooltip == null ? button : Tooltip(message: tooltip!, child: button);
  }
}
