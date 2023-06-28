import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

SnackBar responseMessageSnackbar(
    {required String message, required Color color}) {
  return SnackBar(
    duration: const Duration(milliseconds: 1000),
    backgroundColor: color,
    content: Text(toBeginningOfSentenceCase(message) ?? message),
  );
}
