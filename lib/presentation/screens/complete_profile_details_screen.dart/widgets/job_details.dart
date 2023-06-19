import 'package:flutter/material.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key, required this.desigController});
  final TextEditingController desigController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightTen,
        const Text(
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
