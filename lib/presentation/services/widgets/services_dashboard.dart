import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/services/pages/medical_services_screen.dart';
import 'package:ritaj_compound/presentation/services/pages/available_units_screen.dart';
import 'package:ritaj_compound/presentation/services/pages/complaints_screen.dart';
import 'package:ritaj_compound/presentation/services/pages/financial_overview_screen.dart';
import 'package:ritaj_compound/presentation/services/pages/mall_ordering_screen.dart';
import 'package:ritaj_compound/presentation/services/pages/technical_support_screen.dart';

class ServicesDashboard extends StatelessWidget {
  const ServicesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.w),
      child: Column(
        children: [
          15.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _ServiceCard(
                  title: l10n.financialoutlook,
                  subtitle: l10n.installmentsAndPayment,
                  icon: Icons.account_balance_wallet,
                  iconColor: Palette.lightBlue.shade500, // Using blue shade
                  iconBgColor: Palette.lightBlue.shade50,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FinancialOverviewScreen(),
                      ),
                    );
                  },
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: _ServiceCard(
                  title: l10n.complaintsAndReports,
                  subtitle: l10n.reportingProblem,
                  icon: Icons.priority_high,
                  iconColor: Palette.red.shade500,
                  iconBgColor: Palette.red.shade50,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ComplaintsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _ServiceCard(
                  title: l10n.mallOrdering,
                  subtitle: l10n.nearbyMall,
                  icon: Icons.shopping_cart,
                  iconColor: Palette.orange.shade500,
                  iconBgColor: Palette.orange.shade50,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MallOrderingScreen(),
                      ),
                    );
                  },
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: _ServiceCard(
                  title: l10n.availableUnits,
                  subtitle: l10n.unitsStore,
                  icon: Icons.apartment,
                  iconColor: Palette.purple.shade500,
                  iconBgColor: Palette.purple.shade50,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AvailableUnitsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _ServiceCard(
                  title: l10n.medicalServices,
                  subtitle: l10n.clinicAndPharmacy,
                  icon: Icons.medical_services,
                  iconColor: Palette.green.shade500,
                  iconBgColor: Palette.green.shade50,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MedicalServicesScreen(),
                      ),
                    );
                  },
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: _ServiceCard(
                  title: l10n.technicalSupport,
                  subtitle: l10n.technicalSupportDesc,
                  icon: Icons.construction,
                  iconColor: Palette.fayrouz.shade500,
                  iconBgColor: Palette.fayrouz.shade50,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TechnicalSupportScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        // Make card square
        aspectRatio: 1,
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Palette.neutral.color3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.w), // Increased padding
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(icon, color: iconColor, size: 32),
              ),
              16.verticalSpace,
              // Handle Title Overflow
              CustomText.s14(
                title,
                bold: true,
                overflow: true,
              ),
              4.verticalSpace,
              Expanded(
                child: CustomText.s12(
                  subtitle,
                  color: Palette.neutral.color7,
                  overflow: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
