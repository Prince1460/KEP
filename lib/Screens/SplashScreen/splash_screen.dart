import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/Screens/LanguageScreen/languagePage.dart';
import 'package:fyp/Screens/LoginScreen/login_page.dart';
import 'package:fyp/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Student student = Student();
  Widget screen = LoginPage();
  String email = "";
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('email');
    setState(() {
      email = token!;
    });
    if (email != "") {
      Future<List> _futureList = student.getStudentData(email);
      var data = await _futureList;
      student.firstName = data[0]['firstName'];
      student.lastName = data[0]['lastName'];
      student.favoriteSubject = data[0]['favoriteSubject'];
      student.province = data[0]['province'];
      student.email = data[0]['email'];
      student.profilePic = data[0]['profilePic'];
      student.tazkiraNumber = data[0]['tazkiraNumber'];
      setState(() {
        screen = LanguagePage(student: student);
      });
    }
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
                'Kankor',
                style: TextStyle(
                  fontFamily: 'Courgette',
                  fontSize: size.width * 0.15,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SvgPicture.asset(
                'assets/svg/learning.svg',
                width: size.width * 0.8,
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 5000,
                  percent: 1.0,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: primaryColor,
                  onAnimationEnd: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screen),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
