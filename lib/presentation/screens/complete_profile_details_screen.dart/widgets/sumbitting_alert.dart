import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/form_submit_message.dart';

class SubmitAlert extends StatelessWidget {
  const SubmitAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(milliseconds: 3000), () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return const FormSubmitMessage();
        })));
      });
    });

    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: LottieBuilder.asset('assets/lottie_jsons/sending.json'),
    );
  }
}
