import 'package:flutter/material.dart';
import 'package:fyp/Components/header_widget.dart';
import 'package:fyp/Components/theme_helper.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/constants.dart';

class UpdatePage extends StatefulWidget {
  final Student student;
  UpdatePage({required this.student});
  @override
  State<StatefulWidget> createState() {
    return _UpdatePageState();
  }
}

class _UpdatePageState extends State<UpdatePage> {
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
    if (widget.student.firstName == "") {
      return "Please Enter First Name";
    } else if (widget.student.lastName == "") {
      return "Please Enter Last Name";
    } else if (widget.student.province == "") {
      return 'Please enter province';
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
                          'Update Student Info',
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
                          child: TextFormField(
                            initialValue: widget.student.firstName,
                            onChanged: (value) {
                              setState(() {
                                widget.student.firstName = value;
                              });
                            },
                            decoration: ThemeHelper()
                                .textInputDecoration('Enter your first name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          child: TextFormField(
                            initialValue: widget.student.lastName,
                            onChanged: (value) {
                              setState(() {
                                widget.student.lastName = value;
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
                          child: TextFormField(
                            initialValue: widget.student.province,
                            onChanged: (value) {
                              setState(() {
                                widget.student.province = value;
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
                          child: TextFormField(
                            initialValue: widget.student.favoriteSubject,
                            onChanged: (value) {
                              setState(() {
                                widget.student.favoriteSubject = value;
                              });
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                "Enter your favorite subject"),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
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
                                "Update".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            onPressed: () async {
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
                              } else {
                                await widget.student.update();
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Information!'),
                                    content: const Text('Successfully Updated'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
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
