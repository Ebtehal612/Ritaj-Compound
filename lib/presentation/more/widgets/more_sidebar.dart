import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/more/pages/more_screen.dart';
import 'package:ritaj_compound/presentation/more/pages/rentals_and_guests_screen.dart';
import 'package:ritaj_compound/presentation/more/widgets/language_selection_dialog.dart';
import 'package:ritaj_compound/presentation/more/widgets/logout_confirmation_dialog.dart';

class AppSideBar extends StatelessWidget {
  const AppSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return SizedBox(
      width: 280.w,
      child: Drawer(
        child: Column(
          children: [
            /// ===== Header =====
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 70.h,
                bottom: 35.h,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Palette.green.shade700,
                    Palette.green.shade900,
                  ],
                ),
              ),
              child: Column(
                children: [
                  12.verticalSpace,
                  CustomText.s22(
                    l10n.more,
                    color: Colors.white,
                    bold: true,
                  ),
                ],
              ),
            ),

            /// ===== Menu Items =====
            _DrawerItem(
              icon: Icons.person_outline,
              title: l10n.profile,
              onTap: () {
                Navigator.of(context).pop(); 
                context.push(MoreScreen.routeName);
              },
            ),
            _DrawerItem(
              icon: Icons.home_work_outlined,
              title: l10n.rentalsAndGuests,
              onTap: () {
                Navigator.of(context).pop(); 
                context.push(RentalsAndGuestsScreen.routeName);
              },
            ),
            _DrawerItem(
              icon: Icons.language,
              title: l10n.language,
              onTap: () {
                Navigator.of(context).pop();
                _showLanguageDialog(context);
              },
            ),
            _DrawerItem(
              icon: Icons.logout,
              title: l10n.logout,
              isLogout: true,
              onTap: () {
                Navigator.of(context).pop();
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LanguageSelectionDialog(),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LogoutConfirmationDialog(),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isLogout ? Colors.red : Colors.black87;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 14.sp,
        ),
      ),
      onTap: onTap,
    );
  }
}