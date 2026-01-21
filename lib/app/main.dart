import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:ritaj_compound/app/di/injection_container.dart' as di;
import 'app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await di.init();
  runApp(const MyApp());
}