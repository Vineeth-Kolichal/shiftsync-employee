import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/constants/constants.dart';

class TotalSalarySection extends StatelessWidget {
  const TotalSalarySection({
    super.key,
    required this.totalSalary,
  });
  final int totalSalary;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.width * 0.3,
      decoration: itemBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: const TitileText(title: 'Total Salary:'),
            ),
            kheightTwenty,
            BoldTitleText(
              title: '$totalSalary',
              fontSize: 24,
            )
          ],
        ),
      ),
    );
  }
}
