import 'package:flutter/material.dart';
import 'package:shiftsync/util/colors/common_colors.dart';

class TitileText extends StatelessWidget {
  const TitileText({super.key, required this.title, this.fontSize = 15});
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: titleColor,
      ),
    );
  }
}
