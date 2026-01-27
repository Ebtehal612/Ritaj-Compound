import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/localization/localization_manager.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class LanguageSelectionDialog extends StatelessWidget {
  const LanguageSelectionDialog({super.key});

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
            // Title
            CustomText.s20(
              l10n.selectLanguage,
              bold: true,
              color: Colors.black87,
            ),
            24.verticalSpace,
            
            // Arabic Option
            _buildLanguageOption(
              context: context,
              title: l10n.arabic,
              flagAsset: '🇪🇬', // Egyptian flag emoji
              isSelected: context.read<LocaleCubit>().state.languageCode == 'ar',
              onTap: () {
                context.read<LocaleCubit>().toArabic();
                Navigator.of(context).pop();
              },
            ),
            
            16.verticalSpace,
            
            // English Option
            _buildLanguageOption(
              context: context,
              title: l10n.english,
              flagAsset: '🇺🇸', // American flag emoji
              isSelected: context.read<LocaleCubit>().state.languageCode == 'en',
              onTap: () {
                context.read<LocaleCubit>().toEnglish();
                Navigator.of(context).pop();
              },
            ),
            
            24.verticalSpace,
            
            // Cancel Button
            SizedBox(
              width: double.infinity,
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
                  l10n.cancel,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required String title,
    required String flagAsset,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? Palette.green.shade50 : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Palette.green.shade300 : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Palette.green.shade100,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ] : null,
        ),
        child: Row(
          children: [
            // Flag
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Text(
                  flagAsset,
                  style: TextStyle(fontSize: 24.sp),
                ),
              ),
            ),
            16.horizontalSpace,
            
            // Language Name
            Expanded(
              child: CustomText.s16(
                title,
                bold: isSelected,
                color: isSelected ? Palette.green.shade700 : Colors.black87,
              ),
            ),
            
            // Selection Indicator
            AnimatedScale(
              scale: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.check_circle,
                color: Palette.green.shade700,
                size: 24.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}