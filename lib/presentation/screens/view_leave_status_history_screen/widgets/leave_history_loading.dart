import 'package:flutter/material.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class LeaveHistoryLoading extends StatelessWidget {
  const LeaveHistoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
          itemBuilder: (ctx, index) {
            return const LoadingTile();
          },
          separatorBuilder: (ctx, index) {
            return kHeightTen;
          },
          itemCount: 10),
    );
  }
}

class LoadingTile extends StatelessWidget {
  const LoadingTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  enabled: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    height: 12,
                    width: size.width * 0.4,
                  ),
                ),
                Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      height: 20,
                      width: 70,
                    )),
              ],
            ),
            const Divider(
              color: customPrimaryColor,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        enabled: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          height: 12,
                          width: size.width * 0.3,
                        ),
                      ),
                      kHeightTen,
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        enabled: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          height: 12,
                          width: size.width * 0.32,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.1,
                  child: const VerticalDivider(
                    color: customPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        enabled: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          height: 12,
                          width: size.width * 0.3,
                        ),
                      ),
                      kHeightTen,
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        enabled: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          height: 12,
                          width: size.width * 0.32,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
