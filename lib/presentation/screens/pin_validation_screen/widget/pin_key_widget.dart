import 'package:flutter/material.dart';

class PinKeyboardButton extends StatelessWidget {
  const PinKeyboardButton({
    super.key,
    required this.size,
    this.onTap,
    required this.keylabel,
  });

  final Size size;
  final Function()? onTap;
  final Widget keylabel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: size.width * 0.15,
        width: size.width * 0.27,
        child: Center(
          child: keylabel,
        ),
      ),
    );
  }
}
