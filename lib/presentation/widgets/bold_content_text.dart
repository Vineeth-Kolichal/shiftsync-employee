import 'package:flutter/material.dart';

class BoldContentText extends StatelessWidget {
  const BoldContentText({super.key, required this.content, this.fontSIze = 15});
  final String content;
  final double fontSIze;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontSIze,
      ),
    );
  }
}
