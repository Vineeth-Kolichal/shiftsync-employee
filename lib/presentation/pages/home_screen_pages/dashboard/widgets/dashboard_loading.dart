
import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/widgets/shimmer_loading_widget.dart';
import 'package:shiftsync/util/colors/common_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class DashboardLoadingWidget extends StatelessWidget {
  const DashboardLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            kheightTwenty,
            Container(
              height: size.width * 0.45,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kWhiteColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimmerLoadingWidget(
                    height: 10,
                    width: size.width * 0.4,
                  ),
                  SimmerLoadingWidget(
                    height: 10,
                    width: size.width * 0.5,
                  ),
                  SimmerLoadingWidget(
                    height: 10,
                    width: size.width * 0.4,
                  ),
                  kHeightTen,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SimmerLoadingWidget(
                        height: 10,
                        width: size.width * 0.3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            kheightTwenty,
            SimmerLoadingWidget(
              height: 10,
              width: size.width * 0.4,
            ),
            kheightTwenty,
            Container(
              width: size.width * 0.9,
              height: size.width * 0.3,
              decoration: itemBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SimmerLoadingWidget(
                          height: 10,
                          width: size.width * 0.3,
                        ),
                      ],
                    ),
                    kheightTwenty,
                    SimmerLoadingWidget(
                      height: 15,
                      width: size.width * 0.4,
                    ),
                  ],
                ),
              ),
            ),
            kheightTwenty,
            Container(
              width: size.width * 0.9,
              height: size.width * 0.3,
              decoration: itemBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SimmerLoadingWidget(
                          height: 10,
                          width: size.width * 0.3,
                        ),
                      ],
                    ),
                    kheightTwenty,
                    SimmerLoadingWidget(
                      height: 15,
                      width: size.width * 0.4,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
