import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class FinancialOverviewContent extends StatelessWidget {
  const FinancialOverviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Installments Overview Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s16(l10n.overviewOfInstallments, bold: true),
              TextButton(
                onPressed: () {},
                child: CustomText.s14(l10n.paymentDetail,
                    color: Palette.green.shade500),
              ),
            ],
          ),
          12.verticalSpace,

          // Summary Cards
          Row(
            children: [
              Expanded(
                child: _SummaryCard(
                  title: l10n.paid,
                  count: '8',
                  subtitle: l10n.fromTotalInstallments(12),
                  icon: Icons.check_circle,
                  iconColor: Palette.green.shade500,
                  iconBgColor: Palette.green.shade50,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: _SummaryCard(
                  title: l10n.pending,
                  count: '2',
                  subtitle: l10n.needsPayment(2),
                  icon: Icons.access_time_filled,
                  iconColor: Palette.orange.shade500,
                  iconBgColor: Palette.orange.shade50,
                ),
              ),
            ],
          ),
          24.verticalSpace,

          // Actionable Installment Cards
          _ActionCard(
            title: l10n.servicesInstallment,
            amount: '2,500',
            status: l10n.due,
            statusLabel: l10n.dueToday,
            buttonText: l10n.payNow,
            buttonColor: Palette.orange.shade500,
            showWarning: true,
            borderColor: Palette.orange.shade200,
          ),
          16.verticalSpace,
          _ActionCard(
            title: l10n.maintenanceInstallment,
            amount: '1,800',
            status: l10n.late,
            statusLabel: l10n.lateDays(3),
            buttonText: l10n.payImmediately,
            buttonColor: Colors.red,
            showError: true,
            borderColor: Colors.red[100]!,
          ),
          24.verticalSpace,

          // Payment Methods
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s16(l10n.paymentMethods, bold: true),
              TextButton(
                onPressed: () {},
                child:
                    CustomText.s14(l10n.addCard, color: Palette.green.shade500),
              ),
            ],
          ),
          12.verticalSpace,
          _VirtualCard(),
          12.verticalSpace,
          _WalletOption(),
          24.verticalSpace,

          // Recent Transactions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s16(l10n.recentTransactions, bold: true),
              TextButton(
                onPressed: () {},
                child:
                    CustomText.s14(l10n.viewAll, color: Palette.green.shade500),
              ),
            ],
          ),
          12.verticalSpace,
          _TransactionItem(
            title: l10n.gymSubscription,
            amount: '300',
            date: l10n.yesterdayAt('10:15 ص'),
            status: l10n.completed,
            icon: Icons.fitness_center,
            iconColor: Palette.lightBlue.shade500,
            iconBgColor: Palette.lightBlue.shade50,
          ),
          _TransactionItem(
            title: l10n.mallOrder,
            amount: '125',
            date: l10n.yesterdayAt('6:45 م'),
            status: l10n.completed,
            icon: Icons.shopping_basket,
            iconColor: Palette.purple.shade500,
            iconBgColor: Palette.purple.shade50,
          ),
          _TransactionItem(
            title: l10n.maintenanceInstallment,
            amount: '1,800',
            date: l10n.daysAgo(3),
            status: l10n.pending,
            icon: Icons.build_circle,
            iconColor: Palette.orange.shade500,
            iconBgColor: Palette.orange.shade50,
            isPending: true,
          ),
          _TransactionItem(
            title: l10n.electricityBill,
            amount: '450',
            date: l10n.daysAgo(5),
            status: l10n.completed,
            icon: Icons.receipt_long,
            iconColor: Colors.red,
            iconBgColor: Colors.red[50]!,
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String count;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const _SummaryCard({
    required this.title,
    required this.count,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              CustomText.s14(title, color: Palette.neutral.color7),
            ],
          ),
          12.verticalSpace,
          CustomText.s24(count, bold: true),
          CustomText.s12(subtitle, color: Palette.neutral.color7),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String amount;
  final String status;
  final String statusLabel;
  final String buttonText;
  final Color buttonColor;
  final bool showWarning;
  final bool showError;
  final Color borderColor;

  const _ActionCard({
    required this.title,
    required this.amount,
    required this.status,
    required this.statusLabel,
    required this.buttonText,
    required this.buttonColor,
    this.showWarning = false,
    this.showError = false,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: showError ? Colors.red[50]! : Palette.orange.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  showError ? Icons.warning_amber_rounded : Icons.info_outline,
                  color: showError ? Colors.red : Palette.orange.shade500,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s16(title, bold: true),
                    CustomText.s12(statusLabel,
                        color: showError ? Colors.red : Palette.neutral.color7),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText.s18(amount, bold: true),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color:
                          showError ? Colors.red[50]! : Palette.orange.shade50,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: CustomText.s10(
                      status,
                      color: showError ? Colors.red : Palette.orange.shade500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: CustomText.s14(buttonText,
                      color: Colors.white, bold: true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VirtualCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xff2259D4), // Matching blue from design
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xff12B886), // Green tag
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: CustomText.s12(l10n.defaultLabel,
                    color: Colors.white, bold: true),
              ),
              Row(
                children: [
                  CustomText.s14(l10n.virtualCard, color: Colors.white),
                  10.horizontalSpace,
                  const Icon(Icons.credit_card, color: Colors.white, size: 24),
                ],
              ),
            ],
          ),
          24.verticalSpace,
          Center(
            child: CustomText.s20('**** ****', color: Colors.white, bold: true),
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s14('أحمد محمد علي', color: Colors.white),
              CustomText.s18('**** 4532', color: Colors.white, bold: true),
            ],
          ),
        ],
      ),
    );
  }
}

class _WalletOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Palette.neutral.color3),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Palette.green.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.account_balance_wallet_outlined,
                color: Palette.green.shade500),
          ),
          12.horizontalSpace,
          CustomText.s14(l10n.paymentFromWallet),
          const Spacer(),
          Icon(Icons.arrow_forward_ios,
              size: 16, color: Palette.neutral.color6),
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final String status;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final bool isPending;

  const _TransactionItem({
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.isPending = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s14(title, bold: true),
                CustomText.s12(date, color: Palette.neutral.color6),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText.s14('- $amount ج.م', color: Colors.red, bold: true),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isPending
                      ? Palette.orange.shade50
                      : Palette.green.shade50,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: CustomText.s10(
                  status,
                  color: isPending
                      ? Palette.orange.shade500
                      : Palette.green.shade500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
