import 'package:flutter/material.dart';
import 'package:fyp/Model/Question/question.dart';
import 'package:fyp/constants.dart';

class AnswerPage extends StatefulWidget {
  final List<Question> quizQuestions;
  final TextAlign align;
  AnswerPage({
    required this.quizQuestions,
    required this.align,
  });

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
          title: const Text(
            'Answers',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Courgette",
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: widget.quizQuestions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(
                    widget.quizQuestions[index].title,
                    textAlign: widget.align,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      widget.quizQuestions[index].answer,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
