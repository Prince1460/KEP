import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/Components/subject_card_widget.dart';
import 'package:fyp/Screens/QuizScreen/quiz_splash_screen.dart';
import 'package:fyp/constants.dart';

class SubjectsScreen extends StatelessWidget {
  final String language;
  SubjectsScreen({required this.language});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'Select a Subject',
            style: TextStyle(
              fontFamily: "Courgette",
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SubjectCard(
                      title: 'Mathematics',
                      progress: 67,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSplashScreen(
                              language: language,
                              subject: 'Maths',
                              time: 300,
                            ),
                          ),
                        );
                      },
                      image: 'assets/images/maths.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                    progress: 45,
                    title: 'Physics',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizSplashScreen(
                            language: language,
                            subject: 'Physics',
                            time: 300,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/physics.jpg',
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SubjectCard(
                      title: 'Geography',
                      progress: 67,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSplashScreen(
                              language: language,
                              subject: 'Geography',
                              time: 300,
                            ),
                          ),
                        );
                      },
                      image: 'assets/images/geography.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                    progress: 45,
                    title: 'Biology',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizSplashScreen(
                            language: language,
                            subject: 'Biology',
                            time: 300,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/biology.jpg',
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SubjectCard(
                      title: 'Chemistry',
                      progress: 67,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSplashScreen(
                              language: language,
                              subject: 'Chemistry',
                              time: 300,
                            ),
                          ),
                        );
                      },
                      image: 'assets/images/chemistry.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                    progress: 45,
                    title: 'General Knowl...',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizSplashScreen(
                            language: language,
                            subject: 'General Knowledge',
                            time: 300,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/GeneralKnowledge.jpg',
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SubjectCard(
                      title: 'Geology',
                      progress: 67,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSplashScreen(
                              language: language,
                              subject: 'Geology',
                              time: 300,
                            ),
                          ),
                        );
                      },
                      image: 'assets/images/Geology.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                    progress: 45,
                    title: 'History',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizSplashScreen(
                            language: language,
                            subject: 'History',
                            time: 300,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/History.jpg',
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SubjectCard(
                      title: 'Islamic Studies',
                      progress: 67,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSplashScreen(
                              language: language,
                              subject: 'IslamicStudies',
                              time: 300,
                            ),
                          ),
                        );
                      },
                      image: 'assets/images/Islamic.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                    progress: 45,
                    title: 'Pashto',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizSplashScreen(
                            language: language,
                            subject: 'Pashto',
                            time: 300,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/pashto.jpg',
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SubjectCard(
                      title: 'Dari',
                      progress: 67,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSplashScreen(
                              language: language,
                              subject: 'Dari',
                              time: 300,
                            ),
                          ),
                        );
                      },
                      image: 'assets/images/dari.jpg',
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
