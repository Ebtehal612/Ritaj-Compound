import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/services/widgets/financial_overview_content.dart';

class FinancialOverviewScreen extends StatelessWidget {
  static const routeName = '/financial-overview-screen';
  const FinancialOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        height: 60.h,
        automaticallyImplyLeading: false,
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
                    l10n.financialoutlook,
                    bold: true,
                    maxLines: 1,
                    overflow: true,
                  ),
                  5.verticalSpace,
                  CustomText.s12(
                    l10n.installmentsAndPayment,
                    color: Palette.neutral.color7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const FinancialOverviewContent(),
    );
  }
}
