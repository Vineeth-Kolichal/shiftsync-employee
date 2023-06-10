import 'package:flutter/material.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.leading, this.title, this.trailing});
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarColor,
      width: double.infinity,
      height: 50,
      child: Stack(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Center(child: title),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [leading ?? kWidthFive, trailing ?? kWidthFive],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
