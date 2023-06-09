import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/colors/common_colors.dart';
import 'package:shiftsync/util/debouncer/debouncer.dart';

// ignore: must_be_immutable
class SignInTextFormField extends StatelessWidget {
  SignInTextFormField(
      {super.key,
      required this.icon,
      required this.hintText,
      this.suffix,
      this.obscureText = false,
      required this.controller,
      required this.keyboardType,
      required this.formKey,
      this.onChanged});
  final IconData icon;
  final String hintText;
  final Widget? suffix;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final GlobalKey<FormState>? formKey;

  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    Debouncer debouncer = Debouncer(milliseconds: 1000);
    return TextFormField(
      onChanged: onChanged ??
          (value) {
            debouncer.run(() {
              if (formKey != null) {
                formKey?.currentState?.validate();
              }
            });
          },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill $hintText';
        } else if (hintText == 'e-mail') {
          if (!EmailValidator.validate(value)) {
            return 'Please check $hintText id';
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: iconBlackColor,
        ),
        filled: true,
        fillColor: customPrimaryColor[100],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
