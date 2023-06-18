import 'package:flutter/material.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightTen,
        Text(
          '2.Job Details',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        kHeightTen,
        CustomTextFormFiel(
            controller: TextEditingController(), labelText: 'Designation'),
        kHeightTen
      ],
    );
  }
}
