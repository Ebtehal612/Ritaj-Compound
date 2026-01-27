import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/services/widgets/complaints_content.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        height: 60.h,
        automaticallyImplyLeading: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    l10n.complaintsAndReports,
                    bold: true,
                    overflow: true,
                  ),
                  5.verticalSpace,
                  SizedBox(
                    width: 100.w,
                    child: CustomText.s12(l10n.unitLabel('A-305'),
                        color: Palette.neutral.color7),
                  ),
                ],
              ),
            ),
            const Icon(Icons.notifications),
            5.horizontalSpace,
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Palette.green.shade700,
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      body: const ComplaintsContent(),
    );
  }
}
