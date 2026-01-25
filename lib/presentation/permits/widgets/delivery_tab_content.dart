import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class DeliveryTabContent extends StatelessWidget {
  const DeliveryTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _QuickDeliveryPermitCard(),
          24.verticalSpace,
          Row(
            children: [
              CustomText.s16(l10n.activeDeliveries, bold: true),
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
          _ActiveDeliveryCard(
            title: l10n.talonOrder,
            phone: '+20 100 123 4567',
            expectedArrival: l10n.within15Min,
            color: Palette.green.shade400,
          ),
          16.verticalSpace,
          _ActiveDeliveryCard(
            title: l10n.amazon,
            phone: '+20 100 123 4567',
            expectedArrival: l10n.within30Min,
            color: Palette.green.shade400,
          ),
          24.verticalSpace,
          CustomText.s16(l10n.previousDeliveries, bold: true),
          16.verticalSpace,
          _PreviousDeliveryItem(
            name: l10n.noonOrder,
            time: l10n.enteredYesterday('3:15 ${l10n.pm}'),
          ),
          _PreviousDeliveryItem(
            name: l10n.kosharyGeha,
            time: l10n.enteredLastWeek,
          ),
        ],
      ),
    );
  }
}

class _QuickDeliveryPermitCard extends StatelessWidget {
  const _QuickDeliveryPermitCard();

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
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add_alt_1),
                label: Text(l10n.newDeliveryPermit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  side: const BorderSide(color: Colors.white, width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActiveDeliveryCard extends StatelessWidget {
  final String title;
  final String phone;
  final String expectedArrival;
  final Color color;

  const _ActiveDeliveryCard({
    required this.title,
    required this.phone,
    required this.expectedArrival,
    required this.color,
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
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: color.withOpacity(0.1),
                child: Icon(
                  Icons.person,
                  color: color,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s15(title, bold: true),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child:
                          CustomText.s12(phone, color: Palette.neutral.color7),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.share, color: Colors.blueGrey, size: 20),
              12.horizontalSpace,
              const Icon(Icons.qr_code_scanner, color: Colors.teal, size: 20),
            ],
          ),
          15.verticalSpace,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.s12(l10n.expectedArrival,
                      color: Palette.neutral.color7),
                  CustomText.s14(expectedArrival, bold: true),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s11(
                l10n.expire,
                color: Palette.neutral.color7,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                  backgroundColor: Palette.red.shade50,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
    );
  }
}

class _PreviousDeliveryItem extends StatelessWidget {
  final String name;
  final String time;

  const _PreviousDeliveryItem({required this.name, required this.time});

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
