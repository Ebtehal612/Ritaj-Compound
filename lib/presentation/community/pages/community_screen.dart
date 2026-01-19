import 'package:flutter/material.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class CommunityScreen extends StatelessWidget {
  static const routeName = '/community';
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText.s16('Community Screen', bold: true)),
    );
  }
}
