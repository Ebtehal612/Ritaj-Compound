import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/assets/assets.gen.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/utils/dimensions.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/home_page/pages/news_events_screen.dart';
import 'package:ritaj_compound/presentation/home_page/pages/subscription_management_screen.dart';
import 'package:ritaj_compound/presentation/permits/pages/quick_delivery_permit.dart';
import 'package:ritaj_compound/presentation/permits/pages/quick_visitors_permit.dart';
import 'package:ritaj_compound/presentation/services/pages/complaints_screen.dart';
import 'package:ritaj_compound/presentation/services/pages/financial_overview_screen.dart' show FinancialOverviewScreen;

// ================== SECTION: QUICK PROCEDURES ==================
class QuickProceduresSection extends StatelessWidget {
  const QuickProceduresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.s18(AppLocalizations.of(context)!.quickprocedures,
            color: Palette.neutral.color9),
        15.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ProcedureCard(
                icon: Icons.person_add_alt_1,
                label: AppLocalizations.of(context)!.inviteVisitor,
                onTap: () {
                  context.push(QuickVisitorsPermit.routeName);
                }),
            _ProcedureCard(
              icon: Icons.local_shipping,
              label: AppLocalizations.of(context)!.deliveryPermit,
              iconColor: Colors.blue,
              bgColor: Colors.blue.shade50,
              onTap: () {
                context.push(QuickDeliveryPermit.routeName);
              },
            ),
          ],
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ProcedureCard(
              icon: Icons.warning_amber_rounded,
              label: AppLocalizations.of(context)!.reportComplaint,
              iconColor: Colors.red,
              bgColor: Colors.red.shade50,
              onTap: () {
                context.push(ComplaintsScreen.routeName);
              },
            ),
            _ProcedureCard(
              icon: Icons.payment,
              label: AppLocalizations.of(context)!.payInstallment,
              iconColor: Colors.green,
              bgColor: Colors.green.shade50,
              onTap: () {context.push(FinancialOverviewScreen.routeName);},
            ),
          ],
        ),
      ],
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.firstItem,
    required this.secondItem,
  });

  final SummaryItem firstItem;
  final SummaryItem secondItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 343.w,
        height: 240.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Palette.green.shade700,
              Palette.green.shade900,
            ],
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Padding(
          padding: Dimensions.defaultPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText.s20(
                      AppLocalizations.of(context)!.day,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    CustomText.s14(
                      "${AppLocalizations.of(context)!.tuesday}, 15 ${AppLocalizations.of(context)!.october}",
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              _TransparentBox(item: firstItem),
              10.verticalSpace,
              _TransparentBox(item: secondItem),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= MODEL =================
class SummaryItem {
  final Widget icon;
  final String title;
  final String value;

  SummaryItem({
    required this.icon,
    required this.title,
    required this.value,
  });
}

/// ================= UI WIDGET =================
class _TransparentBox extends StatelessWidget {
  const _TransparentBox({required this.item});

  final SummaryItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      height: 68.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.30),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          item.icon,
          15.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.s16(
                item.title,
                color: Colors.white,
              ),
              CustomText.s16(
                item.value,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//==========================================================
class _ProcedureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback? onTap;

  const _ProcedureCard({
    required this.icon,
    required this.label,
    this.iconColor = Colors.teal,
    this.bgColor = const Color(0xFFE0F2F1),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onTap,
        child: Container(
          width: 165.w,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: bgColor,
                child: Icon(icon, color: iconColor, size: 24.sp),
              ),
              10.verticalSpace,
              CustomText.s14(label, center: true),
            ],
          ),
        ),
      ),
    );
  }
}

// ================== SECTION: NEWS & EVENTS ==================
class NewsEventsSection extends StatelessWidget {
  const NewsEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.s18(AppLocalizations.of(context)!.newsAndEvents,
                color: Palette.neutral.color9),
            TextButton(
              onPressed: () {
                context.push(NewsAndEventsScreen.routeName);
              },
              child: CustomText.s14(AppLocalizations.of(context)!.viewAll,
                  color: Palette.green.shade700),
            )
          ],
        ),
        10.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _NewsCard(
                image: Assets.images.pool,
              ),
              15.horizontalSpace,
              _NewsCard(
                title: AppLocalizations.of(context)!.connectNeighbors,
                image: Assets.images.neighbors,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  final String? title;
  final AssetGenImage? image;
  const _NewsCard({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              image: image != null
                  ? DecorationImage(
                      image: image!.provider(),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/600x300"),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Palette.yellow.shade400,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: CustomText.s12(
                          AppLocalizations.of(context)!.activity,
                          color: Colors.white),
                    ),
                    CustomText.s12(AppLocalizations.of(context)!.twoHoursAgo,
                        color: Palette.neutral.color6),
                  ],
                ),
                10.verticalSpace,
                CustomText.s16(
                    title ?? AppLocalizations.of(context)!.poolOpeningTitle,
                    bold: true),
                5.verticalSpace,
                Text(
                  AppLocalizations.of(context)!.poolOpeningDesc,
                  style:
                      TextStyle(fontSize: 12.sp, color: Palette.neutral.color7),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ================== SECTION: SHORTCUTS ==================
class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.s18(AppLocalizations.of(context)!.shortcuts,
            color: Palette.neutral.color9),
        15.verticalSpace,
        _ShortcutTile(
          icon: Icons.map,
          title: AppLocalizations.of(context)!.unitMap,
          subtitle: AppLocalizations.of(context)!.exploreUnits,
          iconColor: Colors.amber,
        ),
        10.verticalSpace,
        _ShortcutTile(
          icon: Icons.people,
          title: AppLocalizations.of(context)!.community,
          subtitle: AppLocalizations.of(context)!.connectNeighbors,
          iconColor: Colors.teal,
        ),
        10.verticalSpace,
        _ShortcutTile(
          icon: Icons.shopping_cart,
          title: AppLocalizations.of(context)!.orderMall,
          subtitle: AppLocalizations.of(context)!.orderStores,
          iconColor: Colors.purple,
        ),
      ],
    );
  }
}

class _ShortcutTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const _ShortcutTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
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
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ]),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: iconColor.withValues(alpha: 0.1),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s16(title, bold: true),
                5.verticalSpace,
                CustomText.s12(subtitle, color: Palette.neutral.color7),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios,
              size: 16.sp, color: Palette.neutral.color5),
        ],
      ),
    );
  }
}

// ================== SECTION: ACTIVE SUBSCRIPTIONS ==================
class ActiveSubscriptionsSection extends StatelessWidget {
  const ActiveSubscriptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.s18(AppLocalizations.of(context)!.activeSubscriptions,
                color: Palette.neutral.color9),
            TextButton(
              onPressed: () {
                context.push(SubscriptionsScreen.routeName);
              },
              child: CustomText.s14(AppLocalizations.of(context)!.viewAll,
                  color: Palette.green.shade700),
            ),
          ],
        ),
        15.verticalSpace,
        _SubscriptionCard(
          icon: Icons.fitness_center,
          color: Colors.green,
          title: AppLocalizations.of(context)!.gym,
          subtitle: AppLocalizations.of(context)!.monthlyPackage,
          status: AppLocalizations.of(context)!.active,
          details: AppLocalizations.of(context)!.expiresInDays(15),
          manageLabel: AppLocalizations.of(context)!.manage,
        ),
        10.verticalSpace,
        _SubscriptionCard(
          icon: Icons.cleaning_services,
          color: Colors.blue,
          title: AppLocalizations.of(context)!.cleaningService,
          subtitle: AppLocalizations.of(context)!.weekly,
          status: AppLocalizations.of(context)!.active,
          details: AppLocalizations.of(context)!.nextSessionTomorrow,
          manageLabel: AppLocalizations.of(context)!.manage,
        ),
      ],
    );
  }
}

class _SubscriptionCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String status;
  final String details;
  final String manageLabel;

  const _SubscriptionCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.details,
    required this.manageLabel,
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
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: color.withValues(alpha: 0.1),
                          child: Icon(icon, color: color, size: 20.sp),
                        ),
                        10.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.s16(title, bold: true, center: false),
                            4.verticalSpace,
                            CustomText.s12(subtitle,
                                color: Palette.neutral.color7),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: Palette.green.shade50,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: CustomText.s12(status,
                              color: Palette.green.shade800),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          15.verticalSpace,
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText.s12(details, color: Palette.neutral.color7),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: CustomText.s14(manageLabel,
                      color: Palette.green.shade700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
