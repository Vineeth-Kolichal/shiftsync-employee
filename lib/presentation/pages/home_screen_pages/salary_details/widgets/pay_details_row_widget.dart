import 'package:flutter/material.dart';
import 'package:shiftsync/util/colors/common_colors.dart';

class PayDetilsRowWidget extends StatelessWidget {
  const PayDetilsRowWidget({
    super.key,
    required this.leadingText,
    this.prefix = '₹',
    required this.text,
    this.fontSize = 17,
    this.fontColor = Colors.black,
    this.leadingFontSize = 15,
    this.leadingColor = titleColor,
  });
  final String text;
  final double fontSize;
  final Color fontColor;
  final String prefix;
  final String leadingText;
  final double leadingFontSize;
  final Color leadingColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leadingText,
            style: TextStyle(
              fontSize: leadingFontSize,
              fontWeight: FontWeight.w500,
              color: leadingColor,
            ),
          ),
          Text(
            '$prefix$text',
            style: TextStyle(
                fontSize: fontSize,
                color: fontColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
