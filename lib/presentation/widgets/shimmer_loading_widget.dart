import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimmerLoadingWidget extends StatelessWidget {
  const SimmerLoadingWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
          height: height,
          width: width,
        ),
      ),
    );
  }
}
