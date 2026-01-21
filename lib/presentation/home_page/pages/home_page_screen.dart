import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/localization/localization_manager.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/home_page/widgets/home_sections.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  static const String routeName = '/home-page-screen';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Palette.green.shade700,
              child: Icon(Icons.apartment, color: Colors.white),
            ),
            10.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s18(
                    AppLocalizations.of(context)!.helloUser("Ahmed"),bold: true,),
                CustomText.s14(
                    AppLocalizations.of(context)!.unitNumber("A-402")),
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
                  activeColor: Colors.white,
                  activeTrackColor: Palette.green.shade400,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Palette.green.shade900,
                  thumbIcon: MaterialStateProperty.resolveWith<Icon?>((states) {
                    return Icon(Icons.language, color: Palette.green.shade700);
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
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              30.verticalSpace,
              SummaryCard(
                firstItem: SummaryItem(
                  icon: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Palette.yellow.shade400,
                    child: Icon(
                      Icons.person_add,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  title: AppLocalizations.of(context)!.expectedVisitor,
                  value: '${AppLocalizations.of(context)!.mohamedAli} - 2:30 ${AppLocalizations.of(context)!.pm}'),
                secondItem: SummaryItem(
                  icon: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Palette.orange.shade500,
                    child: Icon(
                      Icons.credit_card,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  title: AppLocalizations.of(context)!.dueInstallment,
                  value: '2,500 ${AppLocalizations.of(context)!.services}',
                ),
              ),
              20.verticalSpace,
              const QuickProceduresSection(),
              20.verticalSpace,
              const NewsEventsSection(),
              20.verticalSpace,
              const ShortcutsSection(),
              20.verticalSpace,
              const ActiveSubscriptionsSection(),
              50.verticalSpace, // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
