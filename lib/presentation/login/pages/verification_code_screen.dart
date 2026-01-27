import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/utils/dimensions.dart';
import 'package:ritaj_compound/presentation/home_page/pages/home_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ritaj_compound/core/states/base_state.dart';
import 'package:ritaj_compound/domain/auth/entities/user.dart';
import 'package:ritaj_compound/domain/auth/use_cases/login_use_case/login_use_case.dart';
import 'package:ritaj_compound/presentation/login/cubit/login_cubit.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String phone;
  const VerificationCodeScreen({required this.phone, Key? key})
      : super(key: key);

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
                child: BlocListener<LoginCubit, BaseState<User>>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (user) {
                        context.goNamed(HomePageScreen.routeName);
                      },
                      failure: (failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red.shade700,
                            content: Text(failure.message),
                          ),
                        );
                      },
                    );
                  },
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
                    ],
                  ),
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
                      if (_pinController.text.length == 4) {
                        context.read<LoginCubit>().login(
                              params: LoginParams(
                                phone: widget.phone,
                                otp: _pinController.text,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.green.shade700,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        minimumSize: Size(200.w, 48.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r))),
                    child: BlocBuilder<LoginCubit, BaseState<User>>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        if (isLoading) {
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white));
                        }
                        return Text(AppLocalizations.of(context)!.confirm);
                      },
                    ),
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
