import 'package:flutter/material.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class BankAccountDetailsSection extends StatelessWidget {
  const BankAccountDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightTen,
        const Text(
          '4. Bank Account Details',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        kHeightTen,
        CustomTextFormFiel(
            controller: TextEditingController(), labelText: 'Account number'),
        kHeightTen,
        CustomTextFormFiel(
            controller: TextEditingController(), labelText: 'IFSC Code'),
        kHeightTen,
        CustomTextFormFiel(
            controller: TextEditingController(), labelText: 'Name As Passbook'),
        kHeightTen,
      ],
    );
  }
}
