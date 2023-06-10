import 'package:flutter/material.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/presentation/routes/app_routes.dart';
import 'package:shiftsync/presentation/screens/intro_screen/intro_screen.dart';

import 'presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'presentation/screens/splash_screen/splash_screen.dart';

Future<void> main() async {
  runApp(ShiftSyncApp());
}

class ShiftSyncApp extends StatelessWidget {
  AppRoutes appRoutes = AppRoutes();
  ShiftSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
        scaffoldBackgroundColor: scafoldBackgroundColor,
      ),
      onGenerateRoute: appRoutes.onGenerateRoute,
      //home: SplashScreen(),
      // home: SignUpScreen(),
    );
  }
}
