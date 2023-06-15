import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/core/constants/shared_preference_key_names.dart';
import 'package:shiftsync/presentation/screens/pin_validation_screen/pin_validation_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final shared = await SharedPreferences.getInstance();
      final cookieData = shared.getString(cookie);
      final isNewUser = shared.getBool(newUser);
      final pinValue = shared.getString(pin);
      await Future.delayed(const Duration(milliseconds: 3000), () {
        if (isNewUser == true || isNewUser == null) {
          Navigator.of(context).pushReplacementNamed('/intro');
        } else if (cookieData != null) {
          if (pinValue != null) {
            log(pinValue);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((ctx) =>
                    const PinValidationScreen(routeName: '/home_screen')),
              ),
            );
          } else {
            Navigator.of(context).pushReplacementNamed('/home_screen');
          }
        } else {
          Navigator.of(context).pushReplacementNamed('/sign_in');
        }
      });
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/shiftsync.png',
          height: size.width * 0.55,
          width: size.width * 0.55,
        ),
      ),
    );
  }
}
