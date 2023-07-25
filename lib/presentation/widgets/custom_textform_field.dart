import 'package:flutter/material.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      required this.controller,
      this.suffuxIcon,
      this.onTap,
      this.maxLines,
      required this.labelText,
      this.maxLength});
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Widget? suffuxIcon;
  final Function()? onTap;
  final String labelText;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitileText(title: labelText),
        kHeightFive,
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill $labelText';
            } else if (labelText == 'IFSC Code' && value.length < 11) {
              return 'IFSC should be 11 character';
            } else {
              return null;
            }
          },
          maxLength: maxLength,
          maxLines: maxLines,
          onTap: onTap,
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffuxIcon,
            isDense: true,
            //hintText: 'Enter $labelText',
            //labelText: labelText,
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
        ),
      ],
    );
  }
}
