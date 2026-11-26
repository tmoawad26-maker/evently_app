import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/routing/routes.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:evently_app/core/utils/auth_validator.dart';
import 'package:evently_app/core/utils/show_message.dart';
import 'package:evently_app/features/auth/manager/auth_provider.dart';
import 'package:evently_app/features/auth/services/firebase_service.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/features/auth/widgets/login_actions_widget.dart';
import 'package:evently_app/features/auth/widgets/login_input_widget.dart';
import 'package:evently_app/features/auth/widgets/login_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  

  Future<void> _login(AppLocalizations l10n, AuthProvider authProvider) async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    final success = await authProvider.signIn(
      _emailController.text,
      _passwordController.text,
    );
    if (!mounted) return;
    if (!success) {
      showMessage(authProvider.errorMessage, context,StatusType.error);
      return;
    }
    showMessage("Login Success", context,StatusType.success);
    Navigator.pushNamed(context, RouteName.mainLayoutRoute);
  }
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final validator = AuthValidator(l10n);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? AppColors.primaryDark : AppColors.primaryLight;
    final muted = isDark ? AppColors.unSelectIconColorDark : AppColors.authMutedLight;
    final borderColor = isDark ? AppColors.primaryLight : AppColors.authInputBorder;
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(FirebaseService()),
      child: Builder(builder: (providerContext) {
      final authProvider = providerContext.watch<AuthProvider>();
      return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 34.h, 16.w, 24.h),
          child: Form(
            key: _formKey,
            child: Consumer<AuthProvider>(
              builder: (BuildContext context, AuthProvider value, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const LoginLogoWidget(),
                    SizedBox(height: 34.h),
                    Text(
                      l10n.loginTitle,
                      style: AppTextStyles.authTitle.copyWith(
                        color: isDark ? AppColors.authTitleDark : AppColors.primaryLight,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    LoginInputWidget(
                      controller: _emailController,
                      hint: l10n.emailHint,
                      icon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.email],
                      validator: validator.validateEmail,
                      borderColor: borderColor,
                      muted: muted,
                    ),
                    SizedBox(height: 12.h),
                    LoginInputWidget(
                      controller: _passwordController,
                      hint: l10n.passwordHint,
                      icon: Icons.lock_outline,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.password],
                      obscureText: _obscurePassword,
                      visibilityLabel: _obscurePassword ? l10n.showPassword : l10n.hidePassword,
                      onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
                      onSubmitted: (_) => _login(l10n, authProvider),
                      validator: validator.validatePassword,
                      borderColor: borderColor,
                      muted: muted,
                    ),
                    LoginForgotPasswordLink(
                      label: l10n.forgotPassword,
                      color: accent,
                      onPressed: () => Navigator.pushNamed(
                        context,
                        RouteName.forgotPasswordRoute,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    PrimaryButton(
                      label: l10n.login,
                      isLoading: authProvider.isLoading,
                      onPressed: () => _login(l10n, authProvider),
                    ),
                    SizedBox(height: 30.h),
                    LoginSignupLink(
                      prompt: l10n.noAccount,
                      label: l10n.signup,
                      promptColor: muted,
                      actionColor: accent,
                      onPressed: () => Navigator.pushNamed(
                        context,
                        RouteName.registerRoute,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    AuthDivider(label: l10n.or, color: accent, lineColor: borderColor),
                    SizedBox(height: 14.h),
                    LoginGoogleButton(
                      label: l10n.loginWithGoogle,
                      isDark: isDark,
                      borderColor: borderColor,
                      onPressed: () => showMessage(l10n.googleFeedback, context),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      )
      );
      }
      ),
    );
  }
}
