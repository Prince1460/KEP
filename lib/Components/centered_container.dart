import 'package:flutter/material.dart';


class CenteredContainer extends StatelessWidget {
  final Widget child;
  CenteredContainer({required this.child});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
