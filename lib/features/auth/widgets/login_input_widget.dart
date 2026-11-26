import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginInputWidget extends StatelessWidget {
  const LoginInputWidget({
    required this.controller,
    required this.hint,
    required this.icon,
    required this.validator,
    required this.borderColor,
    required this.muted,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.autofillHints,
    this.obscureText = false,
    this.visibilityLabel,
    this.onToggleVisibility,
    this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final FormFieldValidator<String> validator;
  final Color borderColor;
  final Color muted;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final String? visibilityLabel;
  final VoidCallback? onToggleVisibility;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      obscureText: obscureText,
      style: AppTextStyles.authBody.copyWith(
        color: isDark ? Colors.white : null,
      ),
      onFieldSubmitted: onSubmitted,
      decoration: _decoration(context).copyWith(
        suffixIcon: onToggleVisibility == null
            ? null
            : IconButton(
                tooltip: visibilityLabel,
                onPressed: onToggleVisibility,
                icon: Icon(
                  obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  size: 20.r,
                  color: muted,
                ),
              ),
      ),
      validator: validator,
    );
  }

  InputDecoration _decoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final outline = OutlineInputBorder(
      borderRadius: BorderRadius.circular(13.r),
      borderSide: BorderSide(color: borderColor),
    );
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.authHint.copyWith(color: muted, fontSize: 12.sp),
      prefixIcon: Icon(icon, size: 19.r, color: muted),
      filled: true,
      fillColor: isDark ? AppColors.transparent : AppColors.authInputFillLight,
      contentPadding: EdgeInsets.symmetric(vertical: 12.h),
      enabledBorder: outline,
      focusedBorder: outline.copyWith(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.2),
      ),
      errorBorder: outline.copyWith(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      focusedErrorBorder: outline.copyWith(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1.2),
      ),
    );
  }
}
