import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:shiftsync/bussiness_logic/blocs/otp_verification/otp_verification_bloc.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/background_stack.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({
    super.key,
    required this.otpMessage,
    this.onCompleted,
    required this.nextRoute,
  });
  final String otpMessage;
  final _formKey = GlobalKey<FormState>();
  final Function(String)? onCompleted;
  final String nextRoute;

  final defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
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
    width: 40,
    height: 40,
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
    width: 40,
    height: 40,
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
    return BlocListener<OtpVerificationBloc, OtpVerificationState>(
      listener: (context, state) {
        if (state is OtpVerificationResponseState) {
          if (state.signUpOtpResponseModel.status == 201) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 1000),
                backgroundColor: Colors.green,
                content: Text(toBeginningOfSentenceCase(
                        '${state.signUpOtpResponseModel.message}\n Please login to continue') ??
                    'Account created successfully'),
              ),
            );
            Future.delayed(const Duration(milliseconds: 1500), () {
              Navigator.of(context).pushReplacementNamed(nextRoute);
            });
          } else if (state.signUpOtpResponseModel.status == 404) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(toBeginningOfSentenceCase(
                        state.signUpOtpResponseModel.message) ??
                    'Account created successfully'),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(toBeginningOfSentenceCase(
                        state.signUpOtpResponseModel.message) ??
                    'Something error'),
              ),
            );
          }
        }
      },
      child: Scaffold(
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
                      length: 6,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter OTP';
                        } else {
                          return null;
                        }
                      },
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      onCompleted: onCompleted),
                ),
                kHeightTen,
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Center(
                    child:
                        BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: state.isLoading,
                          child: LoadingAnimationWidget.inkDrop(
                            color: customPrimaryColor,
                            size: 25,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                kHeightTen,
                const Text("Don't recieve code?"),
                TextButton(onPressed: () {}, child: const Text('Resend')),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
