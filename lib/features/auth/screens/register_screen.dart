import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/routing/routes.dart';
import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:evently_app/core/utils/auth_validator.dart';
import 'package:evently_app/core/utils/show_message.dart';
import 'package:evently_app/features/auth/manager/auth_provider.dart';
import 'package:evently_app/features/auth/services/firebase_service.dart';
import 'package:evently_app/features/auth/widgets/login_actions_widget.dart';
import 'package:evently_app/features/auth/widgets/login_input_widget.dart';
import 'package:evently_app/features/auth/widgets/login_logo_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController  _nameController;
 late  TextEditingController _emailController;
  late TextEditingController  _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _obscurePassword = true;
  bool _obscureConfirmation = true;
  @override
  void initState() {
   _nameController = TextEditingController();
   _emailController = TextEditingController();
   _passwordController = TextEditingController();
   _confirmPasswordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register(AppLocalizations l10n, AuthProvider authProvider) async {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState!.validate())) return;
    final user = await authProvider.register(
      _emailController.text,
      _passwordController.text,
      _nameController.text,
    );
    if (!mounted) return;
    if (user == null) {
      showMessage(authProvider.errorMessage, context,StatusType.error);
      return;
    }
    showMessage('Account Created Successfully', context, StatusType.success);
    Navigator.pushNamed(context, RouteName.mainLayoutRoute);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final validator = AuthValidator(l10n);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? AppColors.primaryDark : AppColors.primaryLight;
    final muted = isDark ? AppColors.unSelectIconColorDark : AppColors.authMutedLight;
    final border = isDark ? AppColors.primaryLight : AppColors.authInputBorder;
    final FirebaseService firebaseService = FirebaseService();
    return ChangeNotifierProvider<AuthProvider>(
      create: (BuildContext context) => AuthProvider(firebaseService),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16.w, 34.h, 16.w, 24.h),
            child: Form(
              key: _formKey,
              child: Consumer<AuthProvider>(
                builder: (BuildContext context, authProvider, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const LoginLogoWidget(),
                      SizedBox(height: 34.h),
                      Text(
                        l10n.createAccount,
                        style: AppTextStyles.authTitle.copyWith(
                          color: isDark ? AppColors.authTitleDark : AppColors.primaryLight,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      LoginInputWidget(
                        controller: _nameController,
                        hint: l10n.nameHint,
                        icon: Icons.person_outline,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.name],
                        validator: validator.validateName,
                        borderColor: border,
                        muted: muted,
                      ),
                      SizedBox(height: 12.h),
                      LoginInputWidget(
                        controller: _emailController,
                        hint: l10n.emailHint,
                        icon: Icons.mail_outline,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.email],
                        validator: validator.validateEmail,
                        borderColor: border,
                        muted: muted,
                      ),
                      SizedBox(height: 12.h),
                      LoginInputWidget(
                        controller: _passwordController,
                        hint: l10n.passwordHint,
                        icon: Icons.lock_outline,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.newPassword],
                        obscureText: _obscurePassword,
                        visibilityLabel: _obscurePassword ? l10n.showPassword : l10n.hidePassword,
                        onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
                        validator: validator.validatePassword,
                        borderColor: border,
                        muted: muted,
                      ),
                      SizedBox(height: 12.h),
                      LoginInputWidget(
                        controller: _confirmPasswordController,
                        hint: l10n.confirmPasswordHint,
                        icon: Icons.lock_outline,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.newPassword],
                        obscureText: _obscureConfirmation,
                        visibilityLabel: _obscureConfirmation ? l10n.showPassword : l10n.hidePassword,
                        onToggleVisibility: () => setState(
                              () => _obscureConfirmation = !_obscureConfirmation,
                        ),
                          onSubmitted: (_) => _register(l10n, authProvider),
                        validator: (value) => validator.validatePasswordConfirmation(
                          value,
                          _passwordController.text,
                        ),
                        borderColor: border,
                        muted: muted,
                      ),
                      SizedBox(height: 30.h),
                      PrimaryButton(
                        isLoading: context.watch<AuthProvider>().isLoading,
                        label: l10n.signup,
                        onPressed: () => _register(l10n, authProvider),
                      ),
                      SizedBox(height: 12.h),
                      LoginSignupLink(
                        prompt: l10n.alreadyHaveAccount,
                        label: l10n.login,
                        promptColor: muted,
                        actionColor: accent,
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(height: 12.h),
                      AuthDivider(label: l10n.or, color: accent, lineColor: border),
                      SizedBox(height: 14.h),
                      LoginGoogleButton(
                        label: l10n.signupWithGoogle,
                        isDark: isDark,
                        borderColor: border,
                        onPressed: () => showMessage(l10n.googleFeedback, context),
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
