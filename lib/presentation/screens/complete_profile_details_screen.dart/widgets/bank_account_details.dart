import 'package:flutter/material.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class BankAccountDetailsSection extends StatelessWidget {
  const BankAccountDetailsSection({
    super.key,
    required this.accNoController,
    required this.ifscController,
    required this.nameAspassbookController,
  });
  final TextEditingController accNoController;
  final TextEditingController ifscController;
  final TextEditingController nameAspassbookController;
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
        CustomTextFormField(
            controller: accNoController, labelText: 'Account number'),
        kHeightTen,
        CustomTextFormField(controller: ifscController, labelText: 'IFSC Code'),
        kHeightTen,
        CustomTextFormField(
            controller: nameAspassbookController,
            labelText: 'Name As Passbook'),
        kHeightTen,
      ],
    );
  }
}
