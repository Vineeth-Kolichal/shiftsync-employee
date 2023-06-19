import 'package:flutter/material.dart';
import 'package:shiftsync/util/colors/common_colors.dart';

class TitileText extends StatelessWidget {
  const TitileText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: titleColor,
      ),
    );
  }
}
