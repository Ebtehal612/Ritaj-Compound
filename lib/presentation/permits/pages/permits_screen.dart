import 'package:flutter/material.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class PermitsScreen extends StatelessWidget {
  static const routeName = '/permits';
  const PermitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText.s16('Permits Screen', bold: true)),
    );
  }
}
