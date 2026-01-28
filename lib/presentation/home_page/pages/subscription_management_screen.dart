import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/more/pages/more_screen.dart';

class SubscriptionsScreen extends StatelessWidget {
  static const routeName = '/subscriptions';
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            10.horizontalSpace,
            CustomText.s18(
              l10n.subscriptionManagement,
              bold: true,
            ),
            const Spacer(),
            const Icon(Icons.notifications, color: Colors.black),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _summaryCard(l10n),
              20.verticalSpace,
              _actionsRow(l10n),
              24.verticalSpace,
              _sectionTitle(l10n.activeSubscriptions, l10n.manageAll),
              12.verticalSpace,
              _activeSubscriptionCard(
                l10n: l10n,
                title: l10n.fitnessClub,
                price: '500 ${l10n.egp} / ${l10n.monthly}',
                subtitle: l10n.monthlyPackageOpen,
                footer: l10n.expiresIn15Days,
                icon: Icons.fitness_center,
              ),
              12.verticalSpace,
              _activeSubscriptionCard(
                l10n: l10n,
                title: l10n.houseCleaning,
                price: '350 ${l10n.egp} / ${l10n.monthly}',
                subtitle: l10n.weeklyThreeHours,
                footer: l10n.tomorrowTenAM,
                icon: Icons.cleaning_services,
              ),
              24.verticalSpace,
              _sectionTitle(l10n.availableServices, l10n.viewAll),
              12.verticalSpace,
              _availableServicesSection(l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryCard(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Palette.green.shade700,
            Palette.green.shade900,
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Palette.green.shade900.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.s22(
            l10n.activeSubscriptions,
            bold: true,
            color: Colors.white,
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                  child: _summaryItem(l10n.monthlyCost, '850 ${l10n.egp}')),
              const Spacer(),
              Expanded(
                  child:
                      _summaryItem(l10n.thisMonthSavings, '120 ${l10n.egp}')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.s14(
          title,
          color: Colors.white70,
          maxLines: 2,
          overflow: true,
        ),
        8.verticalSpace,
        CustomText.s20(value, bold: true, color: Colors.white),
      ],
    );
  }

  Widget _actionsRow(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(child: _actionButton(Icons.calendar_today, l10n.bookSession)),
        12.horizontalSpace,
        Expanded(child: _actionButton(Icons.add, l10n.newSubscription)),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Palette.dayBreakBlue.color8),
          8.verticalSpace,
          CustomText.s14(label),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String action) {
    return Row(
      children: [
        CustomText.s16(title, bold: true),
        const Spacer(),
        CustomText.s14(action, color: Palette.green.shade700),
      ],
    );
  }

  Widget _activeSubscriptionCard({
    required AppLocalizations l10n,
    required String title,
    required String price,
    required String subtitle,
    required String footer,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Palette.green.shade50,
                child: Icon(icon, color: Palette.green.shade700),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s14(title, bold: true),
                    4.verticalSpace,
                    CustomText.s12(subtitle, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              CustomText.s14(price),
              const Spacer(),
              Icon(Icons.calendar_today,
                  size: 14, color: Palette.dayBreakBlue.color8),
              6.horizontalSpace,
              CustomText.s12(footer),
            ],
          ),
        ],
      ),
    );
  }

  Widget _availableServicesSection(AppLocalizations l10n) {
    return SizedBox(
      height: 370.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        itemCount: 2,
        separatorBuilder: (_, __) => 16.horizontalSpace,
        itemBuilder: (context, index) {
          return SizedBox(
              width: 260.w,
              child: index == 0
                  ? _serviceCard(
                      l10n: l10n,
                      title: l10n.pool,
                      subtitle: l10n.poolAndSauna,
                      monthlyPrice: '300 ${l10n.egp}',
                      yearlyPrice: '3,000 ${l10n.egp}',
                      badge: l10n.save600,
                      icon: Icons.pool,
                      bgColor: Palette.green.shade700,
                      lightIconColor: Colors.cyan.shade100,
                    )
                  : _serviceCard(
                      l10n: l10n,
                      title: l10n.gym,
                      subtitle: l10n.modernEquipmentTrainers,
                      monthlyPrice: '450 ${l10n.egp}',
                      yearlyPrice: '4,500 ${l10n.egp}',
                      badge: l10n.mostPopular,
                      icon: Icons.fitness_center,
                      bgColor: Colors.deepPurple.shade600,
                      lightIconColor: Colors.deepPurple.shade100,
                      flipped: true,
                    ));
        },
      ),
    );
  }

  Widget _serviceCard({
    required AppLocalizations l10n,
    required String title,
    required String subtitle,
    required String monthlyPrice,
    required String yearlyPrice,
    required String badge,
    required IconData icon,
    required Color bgColor,
    required Color lightIconColor,
    bool flipped = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 300.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top row
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: lightIconColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, color: bgColor),
                ),
                const Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: CustomText.s12(
                    badge,
                    color: Colors.white,
                    bold: true,
                  ),
                ),
              ],
            ),
            12.verticalSpace,

            /// Title
            CustomText.s16(title, bold: true),
            4.verticalSpace,
            CustomText.s12(
              subtitle,
              color: Colors.grey,
              maxLines: 1,
              overflow: true,
            ),
            12.verticalSpace,

            /// Prices
            flipped
                ? Row(
                    children: [
                      _priceColumn(l10n.yearly, yearlyPrice, bold: true),
                      const Spacer(),
                      _priceColumn(l10n.monthly, monthlyPrice),
                    ],
                  )
                : Row(
                    children: [
                      _priceColumn(l10n.monthly, monthlyPrice),
                      const Spacer(),
                      _priceColumn(l10n.yearly, yearlyPrice, bold: true),
                    ],
                  ),
            12.verticalSpace,

            /// Features
            _featureRow(l10n.openAccess),
            _featureRow(l10n.saunaUse),
            _featureRow(l10n.personalLockers),
            12.verticalSpace,

            /// Button
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                onPressed: () {},
                child: CustomText.s14(
                  l10n.subscribeNow,
                  color: Colors.white,
                  bold: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceColumn(String label, String price, {bool bold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.s12(label, color: Colors.grey),
        4.verticalSpace,
        CustomText.s16(price, bold: bold),
      ],
    );
  }

  Widget _featureRow(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 16),
          6.horizontalSpace,
          Expanded(
            child: CustomText.s12(
              text,
              maxLines: 1,
              overflow: true,
            ),
          ),
        ],
      ),
    );
  }
}
