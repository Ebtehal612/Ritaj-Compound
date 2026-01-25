import 'package:flutter/material.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class FinancialOverviewContent extends StatelessWidget {
  const FinancialOverviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: CustomText.s16(l10n.financialoutlook, bold: true),
    );
  }
}
