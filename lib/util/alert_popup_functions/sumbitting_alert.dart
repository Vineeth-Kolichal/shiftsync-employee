import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SubmitAlert extends StatelessWidget {
  const SubmitAlert({
    super.key,
    required this.nextScreen,
  });
  final Widget nextScreen;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(milliseconds: 3000), () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) {
            return nextScreen;
          })),
          (route) => false,
        );
      });
    });
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: LottieBuilder.asset('assets/lottie_jsons/sending.json'),
    );
  }
}
