import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/widgets/video_gif/video_gif.dart';
import 'package:ritaj_compound/presentation/login/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash-screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Failsafe timer: navigate to login if video doesn't load/finish within 10 seconds
    Future.delayed(const Duration(seconds: 20), () {
      _navigateToLogin();
    });
  }

  void _navigateToLogin() {
    if (mounted) {
      context.goNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: VideoGif(
          onVideoEnd: _navigateToLogin,
        ),
      ),
    );
  }
}
