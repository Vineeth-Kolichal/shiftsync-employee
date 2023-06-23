import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';

int i = 0;
void showAlert(
    {required BuildContext context,
    required Widget title,
    required String content,
    required String nextRouteName,
    required String buttonLabel}) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: title,
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: SubmitButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(nextRouteName);
                  },
                  label: buttonLabel,
                  buttonWidth: 0.5),
            )
          ],
        );
      });
}
