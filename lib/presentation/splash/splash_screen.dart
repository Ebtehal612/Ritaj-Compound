import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/assets/assets.gen.dart';
import 'package:ritaj_compound/core/utils/dimensions.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/';
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