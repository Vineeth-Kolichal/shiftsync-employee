import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';
import 'package:shiftsync/util/constants/constants.dart';

class ProfileRegOrCorrectionSection extends StatelessWidget {
  const ProfileRegOrCorrectionSection({
    super.key,
    required this.content,
    this.message,
  });
  final String content;
  final Widget? message;
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
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            kHeightFive,
            message ?? const SizedBox(),
            kHeightTen,
            SubmitButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/complete_profile');
              },
              label: 'Complete profile',
              buttonWidth: 0.5,
              radius: 20,
            )
          ],
        ),
      ),
    );
  }
}
