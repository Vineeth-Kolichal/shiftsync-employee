import 'package:flutter/material.dart';
import 'package:shiftsync/util/constants/constants.dart';

class QuoteContainer extends StatelessWidget {
  const QuoteContainer({
    super.key,
    required this.size,
    required this.quote,
    required this.quoteBy,
    required this.bgColor,
  });

  final Size size;
  final String quote;
  final String quoteBy;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      elevation: 4,
      child: Container(
        width: size.width * 0.8,
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kheightTwenty,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                quote,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    quoteBy,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
