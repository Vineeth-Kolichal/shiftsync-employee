import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
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
        const BoldTitleText(title: '3.Communication Details'),
        kHeightTen,
        CustomTextFormField(
          controller: permenentController,
          labelText: 'Permenent address',
          maxLines: 5,
        ),
        kHeightTen,
        CustomTextFormField(
          controller: communicationController,
          labelText: 'Communication address',
          maxLines: 5,
        ),
      ],
    );
  }
}
