import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:evently_app/core/utils/auth_validator.dart';
import 'package:evently_app/core/utils/show_message.dart';
import 'package:evently_app/features/auth/manager/auth_provider.dart';
import 'package:evently_app/features/auth/services/firebase_service.dart';
import 'package:evently_app/features/auth/widgets/login_actions_widget.dart';
import 'package:evently_app/features/auth/widgets/login_input_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword(AppLocalizations l10n, AuthProvider authProvider) {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState!.validate())) return;
    if (!mounted) return;
    authProvider.resetPassword(email: _emailController.text);
    showMessage("Check Your Email", context, StatusType.success);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final validator = AuthValidator(l10n);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? AppColors.primaryDark : AppColors.primaryLight;
    final muted = isDark
        ? AppColors.unSelectIconColorDark
        : AppColors.authMutedLight;
    final border = isDark ? AppColors.primaryLight : AppColors.authInputBorder;
    FirebaseService firebaseService = FirebaseService();
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(firebaseService),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 24.h),
            child: Form(
              key: _formKey,
              child: Consumer<AuthProvider>(
                builder: (BuildContext context, authProvider, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomAppBar(accent: accent, l10n: l10n, isDark: isDark),
                      SizedBox(height: 12.h),
                      Image.asset(
                        AppImages.imagesChangeSetting,
                        height: 260.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 36.h),
                      Text(
                        l10n.forgotPasswordTitle,
                        style: AppTextStyles.authTitle.copyWith(
                          color: isDark
                              ? AppColors.authTitleDark
                              : AppColors.primaryLight,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        l10n.resetPasswordDescription,
                        style: AppTextStyles.authBody.copyWith(
                          color: muted,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      LoginInputWidget(
                        controller: _emailController,
                        hint: l10n.emailHint,
                        icon: Icons.mail_outline,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.email],
                        onSubmitted: (_) => _resetPassword(l10n, authProvider),
                        validator: validator.validateEmail,
                        borderColor: border,
                        muted: muted,
                      ),
                      SizedBox(height: 24.h),
                      PrimaryButton(
                        label: l10n.resetPassword,
                        isLoading: authProvider.isLoading,
                        onPressed: () => _resetPassword(l10n, authProvider),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


