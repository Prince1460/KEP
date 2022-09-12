import 'package:flutter/material.dart';
import 'package:fyp/Components/language_button.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/Screens/HomeScreen/HomePage.dart';
import 'package:fyp/constants.dart';

class LanguagePage extends StatelessWidget {
  final Student student;
  LanguagePage({required this.student});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select a Language',
                style: TextStyle(
                  fontFamily: 'Courgette',
                  color: primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              LanguageButton(
                lanName: 'English',
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        student: student,
                        language: 'en',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              LanguageButton(
                lanName: 'Persian',
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        student: student,
                        language: 'fa',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              LanguageButton(
                lanName: 'Pashto',
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        student: student,
                        language: 'ps',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


