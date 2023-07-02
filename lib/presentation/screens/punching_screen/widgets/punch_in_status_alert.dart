import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PunchInAlert extends StatelessWidget {
  const PunchInAlert({
    super.key,
    required this.isOtpVerified,
  });
  final bool isOtpVerified;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 5000), () {
        Navigator.of(context).pushReplacementNamed('/home_screen');
      });
    });
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: isOtpVerified
          ? LottieBuilder.asset(
              'assets/lottie_jsons/form_submit_success.json',
              width: size.width * 0.2,
            )
          : LottieBuilder.asset(
              'assets/lottie_jsons/form_submit_fail.json',
              width: size.width * 0.2,
            ),
    );
  }
}
