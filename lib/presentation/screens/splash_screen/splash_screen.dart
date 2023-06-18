import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/core/api_end_points/api_end_points.dart';
import 'package:shiftsync/core/cookie_handler/persist_cookiejar.dart';
import 'package:shiftsync/core/constants/shared_preference_key_names.dart';
import 'package:shiftsync/presentation/screens/pin_validation_screen/pin_validation_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final cookies = await persistCookieJar
          .loadForRequest(Uri.parse('$baseUrl $signInPoint'));
      final shared = await SharedPreferences.getInstance();
      final isNewUser = shared.getBool(newUser);
      final pinValue = shared.getString(pin);
      await Future.delayed(const Duration(milliseconds: 3000), () {
        if (isNewUser == true || isNewUser == null) {
          //If user is new user or app is newly installed then navigate to intro screen
          Navigator.of(context).pushReplacementNamed('/intro');
        } else if (cookies.isNotEmpty) {
          //if use already logged in
          if (pinValue != null) {
            //if user is created sequrity pin then navigate to pin validation screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((ctx) =>
                    //route name is the name of the next screen after successfull pin validation
                    const PinValidationScreen(routeName: '/home_screen')),
              ),
            );
          } else {
            //if user is not created a security pin , navigate to home screen
            Navigator.of(context).pushReplacementNamed('/home_screen');
          }
        } else {
          //if user is not logged in then navigate to signin screen
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
