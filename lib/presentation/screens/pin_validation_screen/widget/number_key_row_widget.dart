import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/screens/pin_validation_screen/widget/pin_key_widget.dart';

class NumberKeyRowWidget extends StatelessWidget {
  const NumberKeyRowWidget({
    super.key,
    required this.size,
    required this.pinController,
    required this.keysValue,
  });

  final Size size;
  final TextEditingController pinController;
  final List<String> keysValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.15,
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PinKeyboardButton(
            keylabel: Text(
              keysValue[0],
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            size: size,
            onTap: () {
              if (pinController.text.length < 4) {
                pinController.text = '${pinController.text}${keysValue[0]}';
              }
            },
          ),
          const VerticalDivider(),
          PinKeyboardButton(
            keylabel: Text(
              keysValue[1],
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            size: size,
            onTap: () {
              if (pinController.text.length < 4) {
                pinController.text = '${pinController.text}${keysValue[1]}';
              }
            },
          ),
          const VerticalDivider(),
          PinKeyboardButton(
            keylabel: Text(
              keysValue[2],
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            size: size,
            onTap: () {
              if (pinController.text.length < 4) {
                pinController.text = '${pinController.text}${keysValue[2]}';
              }
            },
          ),
        ],
      ),
    );
  }
}
