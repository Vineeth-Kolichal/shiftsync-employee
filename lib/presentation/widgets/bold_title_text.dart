import 'package:flutter/material.dart';

class BoldTitleText extends StatelessWidget {
  const BoldTitleText({super.key, required this.title, this.fontSize = 17});
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
    );
  }
}
