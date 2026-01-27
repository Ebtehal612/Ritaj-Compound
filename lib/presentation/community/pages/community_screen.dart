import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/community/widgets/groups_tab_content.dart';
import 'package:ritaj_compound/presentation/community/widgets/lost_tab_content.dart';

class CommunityScreen extends StatefulWidget {
  static const routeName = '/community';
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_back_ios),
              10.horizontalSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.s18(
                    l10n.community,
                    bold: true,
                  ),
                  5.verticalSpace,
                  SizedBox(
                    width: 100.w,
                    child: CustomText.s12(l10n.contactneighbors,
                        maxLines: 1,
                        overflow: true,
                        color: Palette.neutral.color7),
                  ),
                ],
              ),
              const Spacer(),
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
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              labelPadding: EdgeInsets.symmetric(horizontal: 50.w),
              tabs: [
                Tab(text: l10n.groups),
                Tab(text: l10n.lost),
              ],
              labelColor: Palette.green.shade700,
              unselectedLabelColor: Palette.neutral.color7,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Palette.green.shade700,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Palette.neutral.color7,
              ),
              dividerColor: Colors.transparent,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
                  color: Palette.green.shade700,
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  GroupsTabContent(),
                  LostTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
