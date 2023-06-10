import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/core/shared_preference_key_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final shared = await SharedPreferences.getInstance();
      final isNewUser = shared.getBool(newUser);
      await Future.delayed(const Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacementNamed(
            (isNewUser == true || isNewUser == null) ? '/intro' : '/sign_in');
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
