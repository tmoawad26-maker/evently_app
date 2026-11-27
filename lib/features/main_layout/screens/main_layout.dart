import 'package:evently_app/core/utils/app_text_styles.dart';
import 'package:evently_app/features/home/screens/home_screen.dart';
import 'package:evently_app/features/main_layout/models/tab_model.dart';
import 'package:evently_app/features/profile/profile_screen.dart';
import 'package:evently_app/features/providers/theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../favourite/screens/favourite_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeProvider.themeMode.isLight
            ? AppColors.onPrimaryLight
            : AppColors.scaffoldBackgroundColorDark,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryLight,
        unselectedItemColor: AppColors.unSelectNavButtonDark,
        selectedLabelStyle: AppTextStyles.textStyle12SemiBold.copyWith(
          color: AppColors.primaryLight,
          fontWeight: .w400,
        ),
        unselectedLabelStyle: AppTextStyles.textStyle12SemiBold.copyWith(
          color: AppColors.unSelectNavButtonDark,
          fontWeight: .w400,
        ),
        items: TabModel.localized(l10n)
            .map(
              (tab) =>
                  BottomNavigationBarItem(icon: tab.icon, label: tab.label),
            )
            .toList(),
      ),
    );
  }
}
