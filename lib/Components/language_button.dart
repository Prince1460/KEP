import 'package:flutter/material.dart';
import 'package:fyp/Components/theme_helper.dart';

class LanguageButton extends StatelessWidget {
  final String lanName;
  final VoidCallback press;
  LanguageButton({required this.lanName, required this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            lanName.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Courgette',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
