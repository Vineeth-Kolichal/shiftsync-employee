import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/background_stack.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({
    super.key,
    required this.otpMessage,
    this.onCompleted,
  });
  final String otpMessage;
  final _formKey = GlobalKey<FormState>();
  final Function(String)? onCompleted;

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 52,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 3, color: customPrimaryColor[100]!),
      ),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 50,
    height: 52,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border:
          Border(bottom: BorderSide(width: 3, color: customPrimaryColor[500]!)),
    ),
  );
  final submittedPinTheme = const PinTheme(
    width: 50,
    height: 52,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 3, color: Colors.white)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundStack(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              LottieBuilder.asset(
                'assets/lottie_jsons/otp.json',
                height: size.width * 0.4,
              ),
              kheightTwenty,
              const Text(
                'Mobile verification',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              kHeightTen,
              Text(
                otpMessage,
                textAlign: TextAlign.center,
              ),
              kheightTwenty,
              Form(
                key: _formKey,
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  length: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter OTP';
                    } else {
                      return null;
                    }
                  },
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  onCompleted: onCompleted
                ),
              ),
              kheightTwenty,
              const Text("Don't recieve code?"),
              TextButton(onPressed: () {}, child: const Text('Resend')),
            ],
          ),
        ),
      )),
    );
  }
}
