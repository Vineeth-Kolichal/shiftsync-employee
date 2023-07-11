import 'package:flutter/material.dart';
import 'package:shiftsync/data/models/salary_history_model/salary_history.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class SalaryHistoryTile extends StatelessWidget {
  const SalaryHistoryTile({
    super.key,
    required this.salaryHistory,
  });
  final SalaryHistory salaryHistory;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: itemBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldTitleText(title: '₹ ${salaryHistory.netSalary}'),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    kHeightFive,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LabelText(label: 'Ref ID: '),
                        Text(
                          '${salaryHistory.rerenceId}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    kHeightFive,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LabelText(label: 'Date: '),
                        Text(
                          '${salaryHistory.date}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    kHeightFive,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LabelText(label: 'Time:'),
                        Text(
                          '${salaryHistory.time}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: VerticalDivider(
                      color: customPrimaryColor,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    kHeightFive,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LabelText(label: 'Allowance: '),
                        Text(
                          '₹${salaryHistory.allowance}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    kHeightFive,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LabelText(label: 'Deductions: '),
                        Text(
                          '₹${salaryHistory.deductions}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    kHeightFive,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LabelText(label: 'Gross Salary:'),
                        Text(
                          '₹${salaryHistory.grossSalary}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(color: Colors.grey),
    );
  }
}
