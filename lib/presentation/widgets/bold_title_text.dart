import 'package:flutter/material.dart';

class BoldTitleText extends StatelessWidget {
  const BoldTitleText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    );
  }
}
