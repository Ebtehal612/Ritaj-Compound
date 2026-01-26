import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/localization/localization_manager.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/permits/widgets/delivery_tab_content.dart';
import 'package:ritaj_compound/presentation/permits/widgets/visitors_tab_content.dart';

class PermitsScreen extends StatefulWidget {
  const PermitsScreen({super.key});
  static const routeName = '/permits';

  @override
  State<PermitsScreen> createState() => _PermitsScreenState();
}

class _PermitsScreenState extends State<PermitsScreen> {
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
                    l10n.permits,
                    bold: true,
                  ),
                  5.verticalSpace,
                  SizedBox(
                    width: 100.w,
                    child: CustomText.s12(
                      l10n.visitormanagementanddelivery,
                      maxLines: 1,
                      overflow: true,
                      color: Palette.neutral.color7
                    ),
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
              5.horizontalSpace,
              BlocBuilder<LocaleCubit, Locale>(
                builder: (context, state) {
                  return Switch(
                    value: state.languageCode == 'en',
                    activeThumbColor: Colors.white,
                    activeTrackColor: Palette.green.shade400,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Palette.green.shade900,
                    thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                      return Icon(Icons.language,
                          color: Palette.green.shade700);
                    }),
                    onChanged: (value) {
                      if (value) {
                        context.read<LocaleCubit>().toEnglish();
                      } else {
                        context.read<LocaleCubit>().toArabic();
                      }
                    },
                  );
                },
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
                Tab(text: l10n.visitors),
                Tab(text: l10n.delivery),
              ],
              labelColor: Palette.green.shade700,
              unselectedLabelColor: Palette.neutral.color7,
              dividerColor: Colors.transparent,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
                  color: Palette.green.shade700,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  VisitorsTabContent(),
                  DeliveryTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
