import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/localization/localization_manager.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/utils/dimensions.dart';
import 'package:ritaj_compound/presentation/home_page/pages/home_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  static const String routeName = '/verification-code-screen';

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section with Gradient
            Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Palette.green.shade700,
                    Palette.green.shade900,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            AppLocalizations.of(context)!.verificationCode,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Language Toggle
                          BlocBuilder<LocaleCubit, Locale>(
                              builder: (context, state) {
                            return Switch(
                              value: state.languageCode == 'en',
                              activeColor: Colors.white,
                              activeTrackColor: Palette.green.shade400,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Palette.green.shade900,
                              thumbIcon:
                                  MaterialStateProperty.resolveWith<Icon?>(
                                      (states) {
                                if (state.languageCode == 'en') {
                                  return Icon(Icons.language,
                                      color: Palette.green.shade700);
                                }
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
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: Dimensions.defaultPagePadding,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.enterCode,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Palette.neutral.color10),
                  ),
                  SizedBox(height: 20.h),
                  // Pinput
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      controller: _pinController,
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 56.w,
                        height: 56.h,
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Palette.neutral.color5),
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 56.w,
                        height: 56.h,
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Palette.green.shade700),
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(HomePageScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.green.shade700,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        minimumSize: Size(200.w, 48.h),
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.r)) 
                        ),
                    child: Text(AppLocalizations.of(context)!.confirm),
                  ),
                  SizedBox(height: 20.h),
                  TextButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.resend,
                        style: TextStyle(color: Palette.green.shade700)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
