import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/localization/localization_manager.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/services/widgets/services_dashboard.dart';

class ServicesScreen extends StatefulWidget {
  static const routeName = '/services';
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back_ios),
            10.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s18(
                  l10n.services,
                  bold: true,
                ),
                5.verticalSpace,
                SizedBox(
                  width: 100.w,
                  child: CustomText.s12(
                    l10n.unitNumber('A-305'),
                    color: Palette.neutral.color7
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.notifications),
            5.horizontalSpace,
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Palette.green.shade700,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            5.horizontalSpace,
            BlocBuilder<LocaleCubit, Locale>(
              builder: (context, state) {
                return Switch(
                  value: state.languageCode == 'en',
                  activeThumbColor: Colors.white,
                  activeTrackColor: Palette.green.shade400,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Palette.green.shade900,
                  thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                    return Icon(Icons.language, color: Palette.green.shade700);
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
      body: const ServicesDashboard(),
    );
  }
}
