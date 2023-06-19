import 'package:flutter/material.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class OtherDetails extends StatelessWidget {
   const OtherDetails({super.key, required this.aadharController, required this.panController});
  final TextEditingController aadharController ;
  final TextEditingController panController ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightTen,
        const Text(
          '5. Other Details',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        kHeightTen,
        CustomTextFormFiel(
            controller:aadharController , labelText: 'Aadhar Number'),
        kHeightTen,
        CustomTextFormFiel(
            controller: panController, labelText: 'PAN number')
      ],
    );
  }
}
