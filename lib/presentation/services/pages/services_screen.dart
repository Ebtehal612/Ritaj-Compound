import 'package:flutter/material.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class ServicesScreen extends StatelessWidget {
  static const routeName = '/services';
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText.s16('Services Screen', bold: true)),
    );
  }
}
