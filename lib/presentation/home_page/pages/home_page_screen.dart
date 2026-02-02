import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/home_page/widgets/home_sections.dart';
import 'package:ritaj_compound/presentation/more/pages/more_screen.dart';
import 'package:ritaj_compound/core/cubits/user_cubit.dart';
import 'package:ritaj_compound/domain/auth/entities/user.dart';
import 'package:ritaj_compound/app/di/injection_container.dart';
import 'package:ritaj_compound/presentation/profile/cubit/profile_cubit.dart';
import 'package:ritaj_compound/core/states/base_state.dart';
import 'package:ritaj_compound/domain/profile/entities/profile.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  static const String routeName = '/home-page-screen';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _profileCubit = sl<ProfileCubit>();
    // Fetch profile data when the screen loads
    _profileCubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileCubit,
      child: Scaffold(
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
                  BlocBuilder<ProfileCubit, BaseState<Profile>>(
                    builder: (context, profileState) {
                      return profileState.maybeWhen(
                        success: (profile) {
                          final userName = profile.name.isNotEmpty ? profile.name : 'User';
                          if (kDebugMode) {
                            print('🔍 HomeScreen Profile name: $userName');
                          }
                          return CustomText.s18(
                            AppLocalizations.of(context)!.helloUser(userName),
                            bold: true,
                          );
                        },
                        orElse: () {
                          // Fallback to UserCubit while profile is loading
                          return BlocBuilder<UserCubit, User?>(
                            builder: (context, user) {
                              final userName = user?.name ?? 'User';
                              if (kDebugMode) {
                                print('🔍 HomeScreen Fallback to User name: $userName');
                              }
                              return CustomText.s18(
                                AppLocalizations.of(context)!.helloUser(userName),
                                bold: true,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  5.verticalSpace,
                  CustomText.s12(AppLocalizations.of(context)!.unitLabel("A-402"),
                      color: Palette.neutral.color7),
                ],
              ),
              const Spacer(),
              const Icon(Icons.notifications),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18),
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
                          Icons.person,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      title: AppLocalizations.of(context)!.expectedVisitor,
                      value:
                          '${AppLocalizations.of(context)!.mohamedAli} - 2:30 ${AppLocalizations.of(context)!.pm}'),
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
      ),
    );
  }

  @override
  void dispose() {
    // Don't dispose the ProfileCubit here since it's managed by DI
    super.dispose();
  }
}
