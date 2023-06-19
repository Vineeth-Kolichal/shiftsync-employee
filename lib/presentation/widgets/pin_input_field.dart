import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shiftsync/util/colors/background_colors.dart';

class PinInputField extends StatelessWidget {
  PinInputField(
      {super.key,
      this.onCompleted,
      this.autofillMethod,
      required this.pinLength,
      this.controller,
      this.keyboardType});
  final Function(String)? onCompleted;
  final AndroidSmsAutofillMethod? autofillMethod;
  final int pinLength;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
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
    AndroidSmsAutofillMethod androidSmsAutofillMethod =
        autofillMethod ?? AndroidSmsAutofillMethod.smsUserConsentApi;
    return Pinput(
        keyboardType: keyboardType ?? TextInputType.number,
        controller: controller,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        length: pinLength,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter PIN';
          } else {
            return null;
          }
        },
        androidSmsAutofillMethod: androidSmsAutofillMethod,
        // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        onCompleted: onCompleted);
  }
}
