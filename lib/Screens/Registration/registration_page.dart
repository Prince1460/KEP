import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fyp/Components/gender_card.dart';
import 'package:fyp/Components/header_widget.dart';
import 'package:fyp/Components/theme_helper.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/Screens/LoginScreen/login_page.dart';
import 'package:fyp/constants.dart';

enum Gender {
  male,
  female,
}
Color activeCardColor = primaryColor;
Color inActiveCardColor = primaryLightColor;

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  String province = "";
  String favoriteSubject = "";
  String profilePic = "";
  Gender selectedGender = Gender.male;
  String tazkiraNumber = '';

  bool isTazkiraNumber() {
    String p = r'^[0-9]{4}-[0-9]{4}-[0-9]{5}$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(tazkiraNumber);
  }

  List subjects = [
    'Physics',
    'Chemistry',
    'Biology',
    'Maths',
    'Geography',
    'General Knowledge',
    'Geology',
    'History',
    'Islamic Studies',
    'Pashto',
    'Dari'
  ];

  String validateUserData() {
    if (firstName == "") {
      return "Please Enter First Name";
    } else if (isTazkiraNumber() == false) {
      return 'Enter a valid Tazkira Number i.e (1100-2134-12493)';
    } else if (lastName == "") {
      return "Please Enter Last Name";
    } else if (password == "") {
      return "Please Enter Password";
    } else if (password.length < 6) {
      return 'Password length must be more than 6';
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 150,
                child: const HeaderWidget(
                  150,
                  false,
                  Icon(Icons.person_add_alt_1_rounded),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.20,
                        ),
                        Text(
                          'Student Registration',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                firstName = value;
                              });
                            },
                            decoration: ThemeHelper()
                                .textInputDecoration('First Name','Enter your first name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                lastName = value;
                              });
                            },
                            decoration: ThemeHelper()
                                .textInputDecoration('Enter your last name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                province = value;
                              });
                            },
                            decoration: ThemeHelper()
                                .textInputDecoration('Enter your province'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            decoration: ThemeHelper()
                                .textInputDecoration("Enter your Email"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                favoriteSubject = value;
                              });
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                "Enter your favorite subject"),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: size.height * 0.05),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            obscureText: true,
                            decoration: ThemeHelper()
                                .textInputDecoration("Enter your password"),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: size.height * 0.05),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                tazkiraNumber = value;
                              });
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                "Enter your Tazkira number"),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: size.height * 0.05),
                        Text(
                          'Select Gender Currently ' +
                              (selectedGender == Gender.male
                                  ? 'Male'
                                  : 'Female'),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedGender = Gender.male;
                                  });
                                },
                                child: GenderCard(
                                  cardColor: selectedGender == Gender.male
                                      ? activeCardColor
                                      : inActiveCardColor,
                                  cardChild: const Center(
                                    child: Text(
                                      'Male',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedGender = Gender.female;
                                  });
                                },
                                child: GenderCard(
                                  cardColor: selectedGender == Gender.female
                                      ? activeCardColor
                                      : inActiveCardColor,
                                  cardChild: const Center(
                                    child: Text(
                                      'Female',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
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
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              int pic = 0;
                              Random random = Random();
                              if (selectedGender == Gender.male) {
                                pic = random.nextInt(2) + 3;
                              } else {
                                pic = random.nextInt(2) + 1;
                              }
                              String validate = validateUserData();
                              if (validate != "") {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Information!'),
                                    content: Text(validate),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              else {
                                Student student = Student();
                                student.email = email;
                                student.password = password;
                                student.firstName = firstName;
                                student.lastName = lastName;
                                student.province = province;
                                student.favoriteSubject = favoriteSubject;
                                student.profilePic = pic.toString();
                                student.tazkiraNumber = tazkiraNumber;
                                var response = await student.register();
                                if (response == true) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Information!'),
                                      content:
                                          const Text('Successfully Registered'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage(),
                                              ),
                                            );
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Information!'),
                                      content: Text(response.toString()),
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
                              }
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Text(
                                "BACK",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
