import 'package:flutter/material.dart';
import 'package:shiftsync/core/colors/background_colors.dart';

class CustomTextFormFiel extends StatelessWidget {
  const CustomTextFormFiel(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      required this.controller,
      this.suffuxIcon,
      this.onTap,
      this.maxLines,
      required this.labelText});
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Widget? suffuxIcon;
  final Function()? onTap;
  final String labelText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffuxIcon,
        isDense: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 58, 57, 57)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: customPrimaryColor[900]!),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: customPrimaryColor[400]!),
        ),
      ),
    );
  }
}
