import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/localization/localization_manager.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/presentation/login/verification_code_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                              AppLocalizations.of(context)!.loginTitle,
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
                                thumbIcon: MaterialStateProperty.resolveWith<Icon?>((states) {
                                  if (state.languageCode == 'en') {
                                    return Icon(Icons.language, color: Palette.green.shade700);
                                  }
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
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Text(
                    AppLocalizations.of(context)!.welcomeBack,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Palette.neutral.color10
                    ),
                  ),
                   SizedBox(height: 10.h),
                   Text(
                    AppLocalizations.of(context)!.loginSubtitle,
                    textAlign: TextAlign.center,
                     style: TextStyle(
                      fontSize: 14.sp,
                      color: Palette.neutral.color7
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Phone Number Field
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.phoneNumber, style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.h),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '1234567890', 
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('+20', style: TextStyle(fontWeight: FontWeight.bold)), // Mock country code
                              ),
                               suffixIcon: Icon(Icons.keyboard_arrow_down), // Mock dropdown
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.mustEnter(AppLocalizations.of(context)!.phoneNumber);
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                    Text(
                    AppLocalizations.of(context)!.weWillSendCode,
                    textAlign: TextAlign.start, // Based on Arabic layout
                      style: TextStyle(
                      fontSize: 12.sp,
                      color: Palette.neutral.color7
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_phoneController.text == '1012345678') {
                          context.pushNamed(VerificationCodeScreen.routeName);
                        } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(AppLocalizations.of(context)!.invalidPhoneNumber)),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.green.shade700,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.sendVerificationCode),
                        SizedBox(width: 8.w),
                        Icon(Icons.send_rounded, size: 16.sp),
                      ],
                    ),
                  ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(AppLocalizations.of(context)!.or),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    OutlinedButton.icon(
                      onPressed: () {},
                    
                      icon: Icon(Icons.email_outlined),
                      label: Text(AppLocalizations.of(context)!.signInWithEmail),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        foregroundColor: Colors.black
                      ),
                    ),
                  SizedBox(height: 30.h),
                    Center(
                      child: Column(
                        children: [
                          Text(AppLocalizations.of(context)!.needHelp, style: TextStyle(color: Palette.neutral.color7)),
                          SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(           
                                child: TextButton.icon(
                              onPressed: (){}, 
                            icon: Icon(Icons.call, color: Palette.green.shade700), 
                                label: Text(AppLocalizations.of(context)!.contactAdministration, style: TextStyle(color: Palette.green.shade700))
                                                      ),
  
                              ),
                              Text("|", style: TextStyle(color: Palette.neutral.color5)),
                              Flexible(
                                child: TextButton.icon(
                                  onPressed: (){}, 
                                  icon: Icon(Icons.chat, color: Palette.green.shade700), 
                                  label: Text(AppLocalizations.of(context)!.whatsapp, style: TextStyle(color: Palette.green.shade700))
                                                            ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
