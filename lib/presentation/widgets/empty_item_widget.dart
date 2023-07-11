import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/util/constants/constants.dart';

class EmptyItemWidget extends StatelessWidget {
  const EmptyItemWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
              width: size.width * 0.5, 'assets/lottie_jsons/search_empty.json'),
          kHeightTen,
          Text(message),
        ],
      ),
    );
  }
}
