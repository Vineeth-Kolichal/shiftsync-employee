import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/colors/common_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class DutySection extends StatelessWidget {
  const DutySection({
    super.key,
    required this.dutyType,
  });
  final String dutyType;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.width * 0.3,
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              left: 5,
              child: LottieBuilder.asset(
                (dutyType == 'Morning duty')
                    ? 'assets/lottie_jsons/morning.json'
                    : (dutyType == 'Evening Duty')
                        ? 'assets/lottie_jsons/evening.json'
                        : 'assets/lottie_jsons/night.json',
                height: size.height * 0.09,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: size.width,
                  child: const TitileText(
                    title: 'Duty Assigned:',
                  ),
                ),
                kHeightTen,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    kWidthTen,
                    BoldTitleText(
                      title: dutyType,
                      fontSize: 24,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
