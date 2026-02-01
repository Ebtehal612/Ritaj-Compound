import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/app/di/injection_container.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/shared_preferences/prefs_keys.dart';
import 'package:ritaj_compound/core/shared_preferences/shared_prefs.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/login/pages/login_screen.dart';
import 'package:ritaj_compound/presentation/permits/cubit/deliveries_cubit.dart';
import 'package:ritaj_compound/presentation/permits/cubit/visitors_cubit.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              width: 64.w,
              height: 64.w,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout,
                color: Colors.red.shade600,
                size: 32.w,
              ),
            ),

            16.verticalSpace,

            // Title
            CustomText.s20(
              l10n.logoutConfirmation,
              bold: true,
              color: Colors.black87,
            ),

            12.verticalSpace,

            // Message
            SizedBox(
              width: 220.w,
              child: CustomText.s16(
                  l10n.logoutMessage,
                  color: Colors.grey.shade600,
                ),
            ),
            

            24.verticalSpace,

            // Buttons
            Row(
              children: [
                // Cancel Button
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: CustomText.s16(
                      l10n.no,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),

                12.horizontalSpace,

                // Logout Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _performLogout(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: CustomText.s16(
                      l10n.yes,
                      color: Colors.white,
                      bold: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _performLogout(BuildContext context) async {
    try {
      final sharedPrefs = sl<SharedPrefs>();
      await sharedPrefs.deleteSecuredValue(key: PrefsKeys.userDetails);
      await sharedPrefs.deleteSecuredValue(key: PrefsKeys.token);
      await sharedPrefs.deleteSecuredValue(key: PrefsKeys.visitorPermitsCache);
      await sharedPrefs.deleteSecuredValue(key: PrefsKeys.deliveryPermitsCache);
      await sharedPrefs.saveBool(key: PrefsKeys.isLogged, value: false);

      // Reset Cubits to clear in-memory state
      sl<VisitorsCubit>().reset();
      sl<DeliveriesCubit>().reset();

      // Navigate to login screen and clear the navigation stack
      if (context.mounted) {
        context.go(LoginScreen.routeName);
      }
    } catch (e) {
      // Handle any errors during logout
      debugPrint('Logout error: $e');
      // Still navigate to login even if cleanup fails
      if (context.mounted) {
        context.go(LoginScreen.routeName);
      }
    }
  }
}
