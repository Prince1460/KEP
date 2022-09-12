import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/Screens/LanguageScreen/languagePage.dart';
import 'package:fyp/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  final String email;
  LoadingPage({required this.email});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Student student = Student();
  void getData() async {
    Future<List> _futureList = student.getStudentData(widget.email);
    var data = await _futureList;
    student.firstName = data[0]['firstName'];
    student.lastName = data[0]['lastName'];
    student.favoriteSubject = data[0]['favoriteSubject'];
    student.province = data[0]['province'];
    student.email = data[0]['email'];
    student.profilePic = data[0]['profilePic'];
    student.tazkiraNumber = data[0]['tazkiraNumber'];
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LanguagePage(student: student),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Signing You in',
                style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: size.width * 0.07,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SpinKitSpinningLines(color: primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
