import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/util/constants/constants.dart';

class PendingRegistrationSection extends StatelessWidget {
  const PendingRegistrationSection({
    super.key,
   required this.message,
  });

  final Widget message;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      decoration: itemBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/lottie_jsons/danger.json',
              height: size.height * 0.07,
            ),
            kHeightTen,
            message,
            kHeightTen,
          ],
        ),
      ),
    );
  }
}
