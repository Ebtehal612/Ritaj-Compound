import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/permits/pages/quick_visitors_permit.dart';

class VisitorsTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _QuickPermitCard(),
          24.verticalSpace,
          Row(
            children: [
              CustomText.s16(l10n.activePermits, bold: true),
              8.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Palette.green.shade50,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: CustomText.s12(
                  '3',
                  color: Palette.green.shade700,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          const _ActivePermitCard(
            visitorName: 'Mohamed Ali',
            phone: '+20 100 123 4567',
            gate: 'Main Gate',
            // In hours
          ),
          16.verticalSpace,
          const _ActivePermitCard(
            visitorName: 'Fathi Hassan',
            phone: '+20 101 987 6543',
          ),
          24.verticalSpace,
          CustomText.s16(l10n.previousVisitors, bold: true),
          16.verticalSpace,
          _PreviousVisitorItem(
              name: 'Ahmed Mohamed', time: '${l10n.yesterday} 3:15 ${l10n.pm}'),
          _PreviousVisitorItem(
              name: 'Sarah Abdullah', time: l10n.lastWeek),
        ],
      ),
    );
  }
}

class _QuickPermitCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 343.w,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Palette.green.shade700,
              Palette.green.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText.s20(
              l10n.createQuickPermit,
              color: Colors.white,
              bold: true,
            ),
            16.verticalSpace,
            SizedBox(
              width: 295.w,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.push(QuickVisitorsPermit.routeName);
                },
                icon: const Icon(Icons.person_add_alt_1,size: 25,),
                label: Text(l10n.newVisitorPermit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  side: const BorderSide(color: Colors.white, width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivePermitCard extends StatelessWidget {
  final String visitorName;
  final String phone;
  final String? gate;

  const _ActivePermitCard({
    required this.visitorName,
    required this.phone,
    this.gate,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Palette.green.shade50,
                  child: Icon(
                    Icons.person,
                    color: Palette.green.shade400,
                  ),
                ),
                12.horizontalSpace,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.s15(visitorName, bold: true),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: CustomText.s12(phone,
                              color: Palette.neutral.color7)),
                    ],
                  ),
                ),
                75.horizontalSpace,
                const Icon(Icons.qr_code_scanner, color: Colors.teal, size: 20),
                12.horizontalSpace,
                const Icon(Icons.share, color: Colors.blueGrey, size: 20),
              ],
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s12(l10n.visittime,
                        color: Palette.neutral.color7),
                    CustomText.s14('2:30 ${AppLocalizations.of(context)!.pm}',
                        bold: true),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s12(l10n.entrancegate,
                        color: Palette.neutral.color7),
                    CustomText.s14(l10n.mainGate, bold: true),
                  ],
                ),
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText.s11(
                  l10n.expire,
                  color: Palette.neutral.color7,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                    backgroundColor: Palette.red.shade50,
                  ),
                  child: CustomText.s11(
                    l10n.cancelthepermit,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviousVisitorItem extends StatelessWidget {
  final String name;
  final String time;

  const _PreviousVisitorItem({required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Palette.neutral.color3,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.s14(name, bold: true),
                  CustomText.s12(time, color: Palette.neutral.color7),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                l10n.inviteAgain,
                style: const TextStyle(color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
