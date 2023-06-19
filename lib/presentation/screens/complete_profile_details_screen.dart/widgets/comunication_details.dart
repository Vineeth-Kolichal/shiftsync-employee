import 'package:flutter/material.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class CommunicationDetails extends StatelessWidget {
  const CommunicationDetails(
      {super.key,
      required this.communicationController,
      required this.permenentController});
  final TextEditingController permenentController;
  final TextEditingController communicationController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightTen,
        const Text(
          '3.Communication Details',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        kHeightTen,
        CustomTextFormFiel(
          controller: permenentController,
          labelText: 'Permenent address',
          maxLines: 5,
        ),
        kHeightTen,
        CustomTextFormFiel(
          controller: communicationController,
          labelText: 'Communication address',
          maxLines: 5,
        ),
      ],
    );
  }
}
