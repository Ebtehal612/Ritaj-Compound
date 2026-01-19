import 'package:flutter/material.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = '/more';
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText.s16('More Screen', bold: true)),
    );
  }
}
