import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/localization/localization_manager.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

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
      length: 3,
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
                    child: CustomText.s11(
                      l10n.visitormanagementanddelivery,
                      maxLines: 1,
                      overflow: true,
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
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(text: l10n.visitors),
                Tab(text: l10n.delivery),
                Tab(text: l10n.history),
              ],
              labelColor: Palette.green.shade700,
              unselectedLabelColor: Palette.neutral.color7,
              indicatorColor: Palette.green.shade700,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _VisitorsTabContent(),
                  Center(child: Text(l10n.delivery)),
                  Center(child: Text(l10n.history)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VisitorsTabContent extends StatelessWidget {
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
            status: 'Active',
            expiryTime: '4', // In hours
          ),
          16.verticalSpace,
          const _ActivePermitCard(
            visitorName: 'Fatimah Hassan',
            phone: '+20 101 987 6543',
            carNumber: 'A B C 1234',
            status: 'Scheduled',
            isScheduled: true,
          ),
          24.verticalSpace,
          CustomText.s16(l10n.previousVisitors, bold: true),
          16.verticalSpace,
          _PreviousVisitorItem(name: 'Ahmed Mohamed', time: 'Yesterday 3:15 PM'),
          _PreviousVisitorItem(name: 'Sarah Abdullah', time: 'Last Week'),
        ],
      ),
    );
  }
}

class _QuickPermitCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width:343.w,
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
              onPressed: () {},
              icon: const Icon(Icons.person_add_alt_1),
              label: Text(l10n.newVisitorPermit),
              style: ElevatedButton.styleFrom(
                
                backgroundColor: Colors.white.withOpacity(0.2),
                foregroundColor: Colors.white,
                elevation: 0,
                side: const BorderSide(color: Colors.white, width: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivePermitCard extends StatelessWidget {
  final String visitorName;
  final String phone;
  final String? gate;
  final String? carNumber;
  final String status;
  final String? expiryTime;
  final bool isScheduled;

  const _ActivePermitCard({
    required this.visitorName,
    required this.phone,
    this.gate,
    this.carNumber,
    required this.status,
    this.expiryTime,
    this.isScheduled = false,
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
                backgroundColor: isScheduled ? Colors.blue.shade50 : Palette.green.shade50,
                child: Icon(
                  Icons.person,
                  color: isScheduled ? Colors.blue.shade400 : Palette.green.shade400,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s16(visitorName, bold: true),
                    CustomText.s12(phone, color: Palette.neutral.color7),
                  ],
                ),
              ),
              const Icon(Icons.qr_code_scanner, color: Colors.teal),
              12.horizontalSpace,
              const Icon(Icons.share, color: Colors.blueGrey),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              if (gate != null) ...[
                _InfoItem(label: l10n.gate, value: gate!),
              ],
              if (carNumber != null) ...[
                _InfoItem(label: l10n.carNumber, value: carNumber!),
              ],
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText.s12(l10n.visitDate, color: Palette.neutral.color7),
                  CustomText.s12(isScheduled ? l10n.tomorrow : l10n.day, bold: true),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isScheduled ? Colors.blue.shade50 : Palette.green.shade50,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: CustomText.s12(
                  status,
                  color: isScheduled ? Colors.blue.shade700 : Palette.green.shade700,
                ),
              ),
              8.horizontalSpace,
              if (expiryTime != null)
                CustomText.s11(
                  'Expires in $expiryTime hours',
                  color: Palette.neutral.color7,
                ),
              const Spacer(),
              TextButton(onPressed: () {}, child: Text(isScheduled ? l10n.edit : l10n.extend)),
              TextButton(
                onPressed: () {},
                child: Text(l10n.cancel, style: const TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.s12(label, color: Palette.neutral.color7),
        CustomText.s12(value, bold: true),
      ],
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
