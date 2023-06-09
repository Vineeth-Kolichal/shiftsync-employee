import 'package:flutter/material.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/presentation/intro_screen/intro_screen.dart';
import 'package:shiftsync/presentation/sign_in_screen/sign_in_screen.dart';

import 'presentation/sign_up_screen/sign_up_screen.dart';
import 'presentation/splash_screen/splash_screen.dart';

Future<void> main() async {
  runApp(ShiftSyncApp());
}

class ShiftSyncApp extends StatelessWidget {
  const ShiftSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
        scaffoldBackgroundColor: scafoldBackgroundColor,
      ),
      //home: SplashScreen(),
      home: SignUpScreen(),
    );
  }
}
