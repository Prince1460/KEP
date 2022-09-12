import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/Screens/HomeScreen/HomePage.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/Components/subject_card_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/BookViewer/bookviewer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp/Components/pdf_reader.dart';
import 'package:fyp/Model/Book/book.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/Model/Book/book.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  Book book = Book();
  late String language;
  Student student = Student();
  late Future<ListResult> futureFiles;
  @override
  void initState() {
    super.initState();
    futureFiles = book.listBooks();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: primaryColor,
          title: Text(
            'Select a Subject',
            style: TextStyle(
                fontFamily: 'courgette'
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
                      title: 'Maths',
                      progress: 67,
                      onTap: () {
                       Navigator.pushReplacement(context,
                       MaterialPageRoute(builder: (context)=>BookViewer(
                         subject: 'Maths',
                         bookPath: 'assets/pdf/G11_Maths.pdf',
                       )));
                      },
                      image: 'assets/images/maths.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                        progress: 45,
                        title: 'Physics',
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>BookViewer(
                                subject: 'Physics',
                                bookPath: 'assets/pdf/G12_Chemestry.pdf',
                              )));
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

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>BookViewer(
                              subject: 'Geography',
                              bookPath: 'assets/pdf/G10_Biology.pdf',
                            )));

                      },
                      image: 'assets/images/geography.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                        progress: 45,
                        title: 'Biology',
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>BookViewer(
                                subject: 'Biology',
                                bookPath: 'assets/pdf/G10_Biology.pdf',
                              )));
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

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>BookViewer(
                              subject: 'Chemistry',
                              bookPath: 'assets/pdf/G10_Biology.pdf',
                            )));

                      },
                      image: 'assets/images/chemistry.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                        progress: 45,
                        title: 'General Knowledge',
                        onTap: () {

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>BookViewer(
                                subject: 'General Knowledge',
                                bookPath: 'assets/pdf/G10_Biology.pdf',
                              )));
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>BookViewer(
                              subject: 'Geology',
                              bookPath: 'assets/pdf/G10_Biology.pdf',
                            )));
                      },
                      image: 'assets/images/Geology.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                        progress: 45,
                        title: 'History',
                        onTap: () {

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>BookViewer(
                                subject: 'History',
                                bookPath: 'assets/pdf/G10_Biology.pdf',
                              )));
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

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>BookViewer(
                              subject: 'Islamic Studies',
                              bookPath: 'assets/pdf/G10_Biology.pdf',
                            )));
                      },
                      image: 'assets/images/Islamic.jpg',
                    ),
                  ),
                  Expanded(
                      child: SubjectCard(
                        progress: 45,
                        title: 'Pashto',
                        onTap: () {

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>BookViewer(
                                subject: 'Pashto',
                                bookPath: 'assets/pdf/G10_Biology.pdf',
                              )));
                        },
                        image: 'assets/images/pashto.jpg',
                      )),

                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SubjectCard(
                      title: 'Dari',
                      progress: 67,
                      onTap: () {

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>BookViewer(
                              subject: 'Dari',
                              bookPath: 'assets/pdf/G10_Biology.pdf',
                            )));
                      },
                      image: 'assets/images/dari.jpg',
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
