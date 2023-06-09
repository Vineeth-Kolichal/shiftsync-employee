import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/intro_screen/intro_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: ((ctx) => const IntroScreen())));
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
