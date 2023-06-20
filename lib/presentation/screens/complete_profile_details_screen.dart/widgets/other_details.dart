import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails(
      {super.key, required this.aadharController, required this.panController});
  final TextEditingController aadharController;
  final TextEditingController panController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightTen,
        const BoldTitleText(title: '5. Other Details'),
        kHeightTen,
        CustomTextFormField(
            controller: aadharController, labelText: 'Aadhar Number'),
        kHeightTen,
        CustomTextFormField(controller: panController, labelText: 'PAN number')
      ],
    );
  }
}
