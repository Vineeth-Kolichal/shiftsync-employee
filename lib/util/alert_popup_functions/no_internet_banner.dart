import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

MaterialBanner noInternetBanner() {
  return const MaterialBanner(
    backgroundColor: Colors.red,
    content: Text(
      'Internet connection lost!!',
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    actions: [SizedBox()],
  );
}
