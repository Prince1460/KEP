import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Components/card.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/Screens/BooksScreen/book_screen.dart';
import 'package:fyp/Screens/GuideScreen/guide_screen.dart';
import 'package:fyp/Screens/LoginScreen/login_page.dart';
import 'package:fyp/Screens/PastPapersScreen/past_paper_screen.dart';
import 'package:fyp/Screens/ProfileScreen/profile_page.dart';
import 'package:fyp/Screens/QuizScreen/quiz_splash_screen.dart';
import 'package:fyp/Screens/ResetPasswordScreen/ResetPassword_Page.dart';
import 'package:fyp/Screens/SubjectScreen/subject_screen.dart';
import 'package:fyp/Screens/UpdateScreen/update_page.dart';
import 'package:fyp/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final Student student;
  final String language;
  final auth = FirebaseAuth.instance;
  HomePage({required this.student, required this.language});

  @override
  Widget build(BuildContext context) {
    String pic = student.profilePic + '.jpg';
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Kankor Home',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Courgette',
            ),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 1.0],
                colors: [
                  primaryColor.withOpacity(0.2),
                  primaryLightColor.withOpacity(0.5),
                ],
              ),
            ),
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        primaryColor,
                        primaryLightColor,
                      ],
                    ),
                  ),
                  child: Container(
                      child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: primaryColor,
                          backgroundImage: AssetImage('assets/profile/' + pic),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          student.firstName,
                          style: const TextStyle(
                            fontFamily: 'Courgette',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                ListTile(
                  leading:
                      const Icon(Icons.home, size: 24, color: Colors.black),
                  title: const Text(
                    'Home',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          student: student,
                          language: language,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.edit, size: 24, color: Colors.black),
                  title: const Text(
                    'Update Profile',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdatePage(student: student)));
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.lock, size: 24, color: Colors.black),
                  title: const Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.info, size: 24, color: Colors.black),
                  title: const Text(
                    'Kankor Guide',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KankorGuide(
                          language: language,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.person, size: 24, color: Colors.black),
                  title: const Text(
                    'Profile',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          student: student,
                        ),
                      ),
                    );
                  },
                ),
                const Divider(
                  color: Colors.black,
                  height: 1,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_rounded,
                    size: 24,
                    color: Colors.black,
                  ),
                  title: const Text(
                    ' Logout',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  onTap: () async {
                    auth.signOut();
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove('email');
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(2),
                  width: double.infinity,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(0))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: size.height * 0.06,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/profile/' + pic),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Hi! ' + student.firstName,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Courgette",
                              fontSize: size.height * 0.05),
                        ),
                        Text(
                          'Welcome to Kankor',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Courgette",
                            fontSize: size.height * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CardWidget(
                        title: 'Daily Test',
                        progress: 100,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubjectsScreen(
                                language: language,
                              ),
                            ),
                          );
                        },
                        image: 'assets/svg/daily_test.svg',
                      ),
                    ),
                    Expanded(
                        child: CardWidget(
                      progress: 100,
                      title: 'Books',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BooksPage(),
                          ),
                        );
                      },
                      image: 'assets/svg/book.svg',
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CardWidget(
                        progress: 100,
                        title: 'Past Papers',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PastPaperPage(),
                            ),
                          );
                        },
                        image: 'assets/svg/paper.svg',
                      ),
                    ),
                    Expanded(
                        child: CardWidget(
                      progress: 100,
                      title: 'Kankor Exam',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSplashScreen(
                              language: language,
                              subject: 'all',
                              time: 1200,
                            ),
                          ),
                        );
                      },
                      image: 'assets/svg/exam.svg',
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
