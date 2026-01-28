import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/assets/assets.gen.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/more/pages/more_screen.dart';

class NewsAndEventsScreen extends StatelessWidget {
  static const routeName = '/news-events';

  const NewsAndEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // ---------------- AppBar ----------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            10.horizontalSpace,
            CustomText.s18(
              l10n.newsAndEvents,
              bold: true,
              color: Colors.black,
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

      // ---------------- Body ----------------
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _alertCard(l10n),
            16.verticalSpace,
            _eventCard(
              l10n: l10n,
              image: Assets.images.pool,
              tag: l10n.event,
              title: l10n.poolOpeningTitle,
              date: l10n.saturday19October,
              time: l10n.tenAM,
              description: l10n.poolOpeningDescription,
              primaryButton: l10n.willAttend,
              secondaryButton: l10n.wontAttend,
              tagColor: Colors.orange,
              mainButtonColor: Palette.green.shade700,
            ),
            16.verticalSpace,
            _newsTextCard(l10n),
            16.verticalSpace,
            _eventCard(
              l10n: l10n,
              image: Assets.images.funday,
              tag: l10n.free,
              title: l10n.childrenFunDay,
              date: l10n.friday25October,
              time: l10n.fourPM,
              description: l10n.childrenFunDescription,
              primaryButton: l10n.registerChildNow,
              tagColor: Colors.purple,
              mainButtonColor: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Alert Card ----------------

  Widget _alertCard(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.push_pin, color: Colors.white),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s14(
                  l10n.importantAnnouncement,
                  bold: true,
                  color: Colors.white,
                ),
                6.verticalSpace,
                CustomText.s12(
                  l10n.compoundRulesMessage,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Event Card ----------------

  Widget _eventCard({
    required AppLocalizations l10n,
    required AssetGenImage image,
    required String tag,
    required String title,
    required String date,
    required String time,
    required String description,
    required Color tagColor,
    required Color mainButtonColor,
    String? primaryButton,
    String? secondaryButton,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------- Image --------
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(18.r),
            ),
            child: Image.asset(
              image.path,
              height: 170.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------- Tag --------
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: tagColor.withOpacity(.15),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: CustomText.s12(
                    tag,
                    color: tagColor,
                    bold: true,
                  ),
                ),

                10.verticalSpace,

                CustomText.s16(title, bold: true),
                8.verticalSpace,

                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14),
                    6.horizontalSpace,
                    CustomText.s12(date),
                    14.horizontalSpace,
                    const Icon(Icons.access_time, size: 14),
                    6.horizontalSpace,
                    CustomText.s12(time),
                  ],
                ),

                10.verticalSpace,

                CustomText.s13(
                  description,
                  color: Colors.grey.shade700,
                ),

                if (primaryButton != null) ...[
                  16.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: () {},
                          child: CustomText.s14(
                            primaryButton,
                            color: Colors.white,
                            bold: true,
                          ),
                        ),
                      ),
                      if (secondaryButton != null) ...[
                        10.horizontalSpace,
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: CustomText.s14(secondaryButton),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _newsTextCard(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE9D6),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: CustomText.s12(
                  l10n.announcement,
                  color: Colors.deepOrange,
                  bold: true,
                ),
              ),
              8.horizontalSpace,
              CustomText.s12(l10n.threeHoursAgo, color: Colors.grey),
              const Spacer(),
              const Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          20.verticalSpace,
          CustomText.s18(
            l10n.elevatorMaintenanceTitle,
            bold: true,
          ),
          CustomText.s14(
            l10n.elevatorMaintenanceDescription,
            color: Colors.grey.shade700,
          ),
          20.verticalSpace,
          Row(
            children: [
              Icon(Icons.share_outlined, size: 18, color: Colors.grey.shade600),
              16.horizontalSpace,
              Icon(Icons.chat_bubble_outline,
                  size: 18, color: Colors.grey.shade600),
              6.horizontalSpace,
              CustomText.s12('3'),
              16.horizontalSpace,
              Icon(Icons.thumb_up_alt_outlined,
                  size: 18, color: Colors.grey.shade600),
              6.horizontalSpace,
              CustomText.s12('15'),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: CustomText.s14(
                  l10n.readMore,
                  color: Palette.green.shade700,
                  bold: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
