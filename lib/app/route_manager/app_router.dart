import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/domain/permits/entities/visitor_permit.dart';
import 'package:ritaj_compound/presentation/home_page/pages/home_page_screen.dart';
import 'package:ritaj_compound/presentation/home_page/pages/news_events_screen.dart';
import 'package:ritaj_compound/presentation/home_page/pages/subscription_management_screen.dart';
import 'package:ritaj_compound/presentation/login/pages/login_screen.dart';
import 'package:ritaj_compound/presentation/login/pages/verification_code_screen.dart';
import 'package:ritaj_compound/presentation/more/pages/rentals_and_guests_screen.dart';
import 'package:ritaj_compound/presentation/permits/pages/quick_delivery_permit.dart';
import 'package:ritaj_compound/presentation/permits/pages/quick_visitors_permit.dart';
import 'package:ritaj_compound/presentation/services/pages/complaints_screen.dart';
import 'package:ritaj_compound/presentation/services/pages/financial_overview_screen.dart';
import 'package:ritaj_compound/presentation/splash/splash_screen.dart';
import '../../core/shared_preferences/prefs_keys.dart';
import '../../core/shared_preferences/shared_prefs.dart';
import 'package:ritaj_compound/presentation/bottom_bar/bottom_bar.dart';
import 'package:ritaj_compound/presentation/permits/pages/permits_screen.dart';
import 'package:ritaj_compound/presentation/community/pages/community_screen.dart';
import 'package:ritaj_compound/presentation/services/pages/services_screen.dart';
import 'package:ritaj_compound/presentation/more/pages/more_screen.dart';
import '../di/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/login/cubit/login_cubit.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // ignore: unused_field
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

  String get _initialLocation {
    final shared = sl<SharedPrefs>();
    final user = shared.getSecuredValue(key: PrefsKeys.userDetails);
    if (user != null) {
      return SplashScreen.routeName;
    } else {
      return SplashScreen
          .routeName; // Always start with splash, splash decides where to go
    }
  }

  late final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: _initialLocation,
    routes: [
      GoRoute(
        name: SplashScreen.routeName,
        path: SplashScreen.routeName,
        pageBuilder: (_, state) => _buildPageWithTransition(
          const SplashScreen(),
          state,
        ),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeName,
        pageBuilder: (_, state) => _buildPageWithTransition(
          BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
          state,
        ),
      ),
      GoRoute(
        name: VerificationCodeScreen.routeName,
        path: VerificationCodeScreen.routeName,
        pageBuilder: (_, state) => _buildPageWithTransition(
          BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: VerificationCodeScreen(phone: state.extra as String),
          ),
          state,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: HomePageScreen.routeName,
                path: HomePageScreen.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomePageScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PermitsScreen.routeName,
                path: PermitsScreen.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PermitsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: CommunityScreen.routeName,
                path: CommunityScreen.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: CommunityScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: ServicesScreen.routeName,
                path: ServicesScreen.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ServicesScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: MoreScreen.routeName,
                path: MoreScreen.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MoreScreen(),
                ),
                routes: [
                  GoRoute(
                    name: RentalsAndGuestsScreen.routeName,
                    path: 'rentals-guests',
                    pageBuilder: (context, state) => _buildPageWithTransition(
                      const RentalsAndGuestsScreen(),
                      state,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: QuickVisitorsPermit.routeName,
                path: QuickVisitorsPermit.routeName,
                pageBuilder: (context, state) => _buildPageWithTransition(
                  QuickVisitorsPermit(initialPermit: state.extra as VisitorPermit?),
                  state,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: QuickDeliveryPermit.routeName,
                path: QuickDeliveryPermit.routeName,
                pageBuilder: (context, state) => _buildPageWithTransition(
                  const QuickDeliveryPermit(),
                  state,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SubscriptionsScreen.routeName,
                path: SubscriptionsScreen.routeName,
                pageBuilder: (context, state) => _buildPageWithTransition(
                  const SubscriptionsScreen(),
                  state,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: NewsAndEventsScreen.routeName,
                path: NewsAndEventsScreen.routeName,
                pageBuilder: (context, state) => _buildPageWithTransition(
                  const NewsAndEventsScreen(),
                  state,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: ComplaintsScreen.routeName,
                path: ComplaintsScreen.routeName,
                pageBuilder: (context, state) => _buildPageWithTransition(
                  const ComplaintsScreen(),
                  state,
                ),
              ),
            ],
          ),
          StatefulShellBranch(routes: 
          [
            GoRoute(
              name: FinancialOverviewScreen.routeName,
              path: FinancialOverviewScreen.routeName,
              pageBuilder: (context, state) => _buildPageWithTransition(
                const FinancialOverviewScreen(),
                state,
              ),
            ),
          ])
        ],
      ),
    ],
  );

  CustomTransitionPage _buildPageWithTransition(
      Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define the transition animation
        const begin = Offset(1.0, 0.0); // Slide from right to left
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
