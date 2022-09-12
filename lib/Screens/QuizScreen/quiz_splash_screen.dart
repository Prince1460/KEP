import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Model/Quiz/quiz.dart';
import 'package:fyp/Screens/QuizScreen/quiz_screen.dart';
import 'package:fyp/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuizSplashScreen extends StatefulWidget {
  final String subject;
  final String language;
  final int time;
  QuizSplashScreen(
      {required this.subject, required this.language, required this.time});
  @override
  _QuizSplashScreenState createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {
  var data;
  Widget page = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinKitSpinningLines(color: primaryColor),
        const SizedBox(height: 15),
        Text(
          'Preparing quiz',
          style: TextStyle(
            fontFamily: 'Courgette',
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'This may take a while',
          style: TextStyle(
            fontFamily: 'Courgette',
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget PageBody() {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Daily Quiz',
            style: TextStyle(
                fontFamily: 'Courgette',
                fontSize: size.width * 0.15,
                color: primaryColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SvgPicture.asset(
            'assets/svg/paper.svg',
            width: size.width * 0.8,
          ),
          SizedBox(
            height: size.height * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 5000,
              percent: 1.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: primaryColor,
              onAnimationEnd: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      quizQuestions: data,
                      time: widget.time,
                      language: widget.language,
                      subject: widget.subject,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void getData() async {
    Quiz quiz = Quiz();
    Future<List> _futureOfList = quiz.getQuiz(widget.subject, widget.language);
    data = await _futureOfList;
    if (data != null) {
      setState(() {
        page = PageBody();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(body: page));
  }
}
