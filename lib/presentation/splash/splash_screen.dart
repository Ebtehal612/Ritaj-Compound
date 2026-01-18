import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/assets/assets.gen.dart';
import 'package:ritaj_compound/core/utils/dimensions.dart';
import 'package:ritaj_compound/presentation/home_page/pages/home_page_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.goNamed(HomePageScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
 return Scaffold(
   body: SafeArea(child: Padding(padding: Dimensions.defaultPagePadding,
   child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [    Transform.scale(
                scale: 1.5,
                child: Assets.images.splash.image(
                  width: 1.sw,)

              ),
              
              ],
   ),
   )),
 ) ;
}
}