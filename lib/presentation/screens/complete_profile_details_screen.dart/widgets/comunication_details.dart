import 'package:flutter/material.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class CommunicationDetails extends StatelessWidget {
  const CommunicationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightTen,
        const Text(
          '2.Communication Details',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        kHeightTen,
        CustomTextFormFiel(
          controller: TextEditingController(),
          labelText: 'Permenent address',
          maxLines: 7,
        ),
        kHeightTen,
        CustomTextFormFiel(
          controller: TextEditingController(),
          labelText: 'Permenent address',
          maxLines: 7,
        ),
      ],
    );
  }
}
