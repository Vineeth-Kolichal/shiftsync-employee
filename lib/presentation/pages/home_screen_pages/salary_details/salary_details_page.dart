// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/salary_details/widgets/pay_details_row_widget.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class SalaryDetailsPage extends StatelessWidget {
  const SalaryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldTitleText(title: 'Pay detials'),
            kDividerTwo,
            PayDetilsRowWidget(
              leadingText: 'Grade:',
              text: 'A level',
              fontColor: customPrimaryColor,
              prefix: '',
            ),
            PayDetilsRowWidget(
              leadingText: 'Pay type:',
              text: 'Salary',
              prefix: '',
            ),
            PayDetilsRowWidget(
              leadingText: 'Pay frequency:',
              text: 'Monthly',
              prefix: '',
            ),
            PayDetilsRowWidget(
              leadingText: 'Base salary',
              text: '18000',
            ),
            kDividerTwo,
            PayDetilsRowWidget(
              leadingText: 'Dearness Allowance',
              text: '800',
            ),
            PayDetilsRowWidget(
              leadingText: 'Special Allowance',
              text: '100',
            ),
            PayDetilsRowWidget(
              leadingText: 'Medical Allowance',
              text: '200',
            ),
            PayDetilsRowWidget(
              leadingText: 'Over time',
              text: '300',
            ),
            PayDetilsRowWidget(
              leadingText: 'Gross Salary',
              leadingColor: Colors.black,
              fontSize: 18,
              fontColor: Colors.green,
              leadingFontSize: 19,
              text: '19300',
            ),
            kDividerTwo,
            PayDetilsRowWidget(leadingText: 'Professional Tax', text: '200'),
            PayDetilsRowWidget(leadingText: 'ProvidentFund', text: '100'),
            PayDetilsRowWidget(
              leadingText: 'Total Deductions',
              leadingColor: Colors.black,
              fontSize: 18,
              fontColor: Colors.red,
              leadingFontSize: 19,
              text: '300',
            ),
            kDividerTwo,
            PayDetilsRowWidget(
              leadingText: 'Net Salary',
              leadingColor: Colors.black,
              fontSize: 21,
              fontColor: Colors.green,
              leadingFontSize: 22,
              text: '19000',
            ),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Iconsax.document_download),
                label: Text('Download salary slip'))
          ],
        ),
      ),
    );
  }
}
