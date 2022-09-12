import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  const ProgressIndicatorWidget({required this.value});
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
        value: value,
        backgroundColor: Colors.white,
        color: primaryColor,
      );
  }
}