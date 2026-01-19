import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/presentation/home_page/pages/home_page_screen.dart';
import 'package:ritaj_compound/presentation/login/login_screen.dart';
import 'package:ritaj_compound/presentation/login/verification_code_screen.dart';
import 'package:ritaj_compound/presentation/splash/splash_screen.dart';
import '../../core/shared_preferences/prefs_keys.dart';
import '../../core/shared_preferences/shared_prefs.dart';
import '../di/injection_container.dart';

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
      return SplashScreen.routeName; // Always start with splash, splash decides where to go
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
          const LoginScreen(),
          state,
        ),
      ),
      GoRoute(
        name: VerificationCodeScreen.routeName,
        path: VerificationCodeScreen.routeName,
        pageBuilder: (_, state) => _buildPageWithTransition(
          const VerificationCodeScreen(),
          state,
        ),
      ),
      GoRoute(
        name: HomePageScreen.routeName,
        path: HomePageScreen.routeName,
        pageBuilder: (_, state) => _buildPageWithTransition(
           const HomePageScreen(),
          state,
        ),
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
