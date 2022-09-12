import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Components/or_divider.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/Components/header_widget.dart';
import 'package:fyp/Components/theme_helper.dart';
import 'package:fyp/Screens/LoginScreen/loading_page.dart';
import 'package:fyp/Screens/Registration/registration_page.dart';
import 'package:fyp/Screens/ResetPasswordScreen/ResetPassword_Page.dart';
import 'package:fyp/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _headerHeight = 250;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(
                  _headerHeight,
                  false,
                  Icon(Icons.login_rounded),
                ),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Text(
                        'Kankor',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      SizedBox(height: size.height * 0.10),
                      Column(
                        children: [
                          Container(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              decoration: ThemeHelper().textInputDecoration(
                                'Enter your Email',
                              ),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: size.height * 0.05),
                          Container(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                'Enter your password',
                              ),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResetPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Forgot your password?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  'Sign In'.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () async {
                                Student student = Student();
                                email = email.trim();
                                var response =
                                    await student.login(email, password);
                                if (response == true) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoadingPage(
                                        email: email.trim(),
                                      ),
                                    ),
                                  );
                                } else {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Information!'),
                                      content: Text(response),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          OrDivider(),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: "Don\'t have an account? "),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RegistrationPage(),
                                          ),
                                        );
                                      },
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
