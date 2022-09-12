import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  GenderCard({required this.cardColor, required this.cardChild});

  final Color cardColor;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: cardChild,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
