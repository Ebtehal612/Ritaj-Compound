import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';

class BottomBar extends StatelessWidget {
  static const routeName = '/bottom-bar';
  final StatefulNavigationShell navigationShell;

  const BottomBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ]),
        child: NavigationBar(
          height: 70.h,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 11, // تصغير الخط يقرب العناصر بصريًا
            ),
          ),
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, color: Palette.green.shade700),
              label: AppLocalizations.of(context)!.home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.assignment_outlined),
              selectedIcon:
                  Icon(Icons.assignment, color: Palette.green.shade700),
              label: AppLocalizations.of(context)!.permits,
            ),
            NavigationDestination(
              icon: const Icon(Icons.people_outlined),
              selectedIcon: Icon(Icons.people, color: Palette.green.shade700),
              label: AppLocalizations.of(context)!.community,
            ),
            NavigationDestination(
              icon: const Icon(Icons.room_service_outlined),
              selectedIcon:
                  Icon(Icons.room_service, color: Palette.green.shade700),
              label: AppLocalizations.of(context)!.services,
            ),
            NavigationDestination(
              icon: const Icon(Icons.more_horiz),
              selectedIcon:
                  Icon(Icons.more_horiz, color: Palette.green.shade700),
              label: AppLocalizations.of(context)!.more,
            ),
          ],
        ),
      ),
    );
  }
}
