import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/localization/localization_manager.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/services/widgets/mall_ordering_content.dart';


class MallOrderingScreen extends StatelessWidget {
  const MallOrderingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        height: 60.h,
        automaticallyImplyLeading: false, // Custom back button
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.s18(
                    l10n.mallOrdering,
                    bold: true,
                    maxLines: 1,
                    overflow: true,
                  ),
                  5.verticalSpace,
                  CustomText.s12(
                    l10n.nearbyMall,
                    color: Palette.neutral.color7,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                const Icon(Icons.shopping_cart_outlined, size: 28),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: CustomText.s10('3', color: Colors.white, bold: true),
                  ),
                ),
              ],
            ),
            16.horizontalSpace,
           BlocBuilder<LocaleCubit, Locale>(
                builder: (context, state) {
                  return Switch(
                    value: state.languageCode == 'en',
                    activeThumbColor: Colors.white,
                    activeTrackColor: Palette.green.shade400,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Palette.green.shade900,
                    thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                      return Icon(Icons.language,
                          color: Palette.green.shade700);
                    }),
                    onChanged: (value) {
                      if (value) {
                        context.read<LocaleCubit>().toEnglish();
                      } else {
                        context.read<LocaleCubit>().toArabic();
                      }
                    },
                  );
                },
              ),
          ],
        ),
      ),
      body: const MallOrderingContent(),
    );
  }
}
