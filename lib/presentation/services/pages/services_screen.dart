import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/more/pages/more_screen.dart';
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
                  child: CustomText.s12(l10n.unitLabel('A-305'),
                      color: Palette.neutral.color7),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.notifications),
            10.horizontalSpace,
            GestureDetector(
              onTap: () {
                context.push(MoreScreen.routeName);
                debugPrint('Avatar clicked');
              },
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: Palette.green.shade700,
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: const ServicesDashboard(),
    );
  }
}
