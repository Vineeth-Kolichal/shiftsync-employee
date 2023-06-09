
import 'package:flutter/material.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/core/colors/common_colors.dart';

class SignInTextFormField extends StatelessWidget {
  const SignInTextFormField(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.suffix,
      required this.obscureText,
      required this.controller,
      required this.keyboardType});
  final IconData icon;
  final String hintText;
  final Widget? suffix;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
