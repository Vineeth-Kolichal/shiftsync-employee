import 'package:flutter/material.dart';
import 'package:shiftsync/core/colors/background_colors.dart';

import 'presentation/splash_screen/splash_screen.dart';

Future<void> main() async {
  runApp(ShiftSyncApp());
}

class ShiftSyncApp extends StatelessWidget {
  const ShiftSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: scafoldBackgroundColor),
      home: SplashScreen(),
    );
  }
}
