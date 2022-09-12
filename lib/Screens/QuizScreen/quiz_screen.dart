import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:fyp/Components/option_button.dart';
import 'package:fyp/Model/Question/question.dart';
import 'package:fyp/Screens/ResultScreen/result_screen.dart';
import 'package:fyp/constants.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> quizQuestions;
  final int time;
  final String language;
  final String subject;
  QuizScreen({
    required this.quizQuestions,
    required this.time,
    required this.language,
    required this.subject,
  });
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

enum Option { first, second, third, fourth }

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int correctAns = 0;
  int falseAns = 0;
  String selectedOption = "";
  bool visible = false;
  Option? option;
  int endTime = 0;
  TextAlign align = TextAlign.start;
  Map<String, int> correctAnswers = {
    'Physics': 0,
    'Chemistry': 0,
    'Biology': 0,
    'Maths': 0,
    'Geography': 0,
    'General Knowledge': 0,
    'Geology': 0,
    'History': 0,
    'IslamicStudies': 0,
    'Pashto': 0,
    'Dari': 0
  };

  Map<String, int> wrongAnswers = {
    'Physics': 0,
    'Chemistry': 0,
    'Biology': 0,
    'Maths': 0,
    'Geography': 0,
    'General Knowledge': 0,
    'Geology': 0,
    'History': 0,
    'IslamicStudies': 0,
    'Pashto': 0,
    'Dari': 0
  };

  void setAlign() {
    if (widget.language != 'en') {
      setState(() {
        align = TextAlign.end;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * widget.time;
    setAlign();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Exit'),
                  content:
                      const Text('Are you sure you want to quit the quiz?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
          backgroundColor: primaryColor,
          centerTitle: true,
          title: CountdownTimer(
            endTime: endTime,
            onEnd: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    trueAns: correctAns,
                    falseAns: falseAns,
                    totalQuestions: widget.quizQuestions.length,
                    quizQuestion: widget.quizQuestions,
                    align: align,
                    correctAnswers: correctAnswers,
                    wrongAnswers: wrongAnswers,
                  ),
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(800),
                        bottomLeft: Radius.circular(800)),
                    color: primaryColor,
                  ),
                  child: Text(
                    widget.quizQuestions[index].title.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                OptionButton(
                  color:
                      option == Option.first ? primaryColor : primaryLightColor,
                  option: widget.quizQuestions[index].option1.toString(),
                  onTap: () {
                    setState(() {
                      option = Option.first;
                      selectedOption =
                          widget.quizQuestions[index].option1.toString();
                      visible = true;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                OptionButton(
                    color: option == Option.second
                        ? primaryColor
                        : primaryLightColor,
                    option: widget.quizQuestions[index].option2.toString(),
                    onTap: () {
                      setState(() {
                        option = Option.second;
                        selectedOption =
                            widget.quizQuestions[index].option2.toString();
                        visible = true;
                      });
                    }),
                const SizedBox(
                  height: 15,
                ),
                OptionButton(
                    color: option == Option.third
                        ? primaryColor
                        : primaryLightColor,
                    option: widget.quizQuestions[index].option3.toString(),
                    onTap: () {
                      setState(() {
                        option = Option.third;
                        selectedOption =
                            widget.quizQuestions[index].option3.toString();
                        visible = true;
                      });
                    }),
                const SizedBox(
                  height: 15,
                ),
                OptionButton(
                    color: option == Option.fourth
                        ? primaryColor
                        : primaryLightColor,
                    option: widget.quizQuestions[index].option4.toString(),
                    onTap: () {
                      setState(() {
                        option = Option.fourth;
                        selectedOption =
                            widget.quizQuestions[index].option4.toString();
                        visible = true;
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: visible,
                  child: GestureDetector(
                    onTap: () {
                      if (index == widget.quizQuestions.length - 1) {
                        String subject = widget.quizQuestions[index].subject;

                        if (selectedOption ==
                            widget.quizQuestions[index].answer.toString()) {
                          correctAns++;
                          var previousValue = correctAnswers[subject];
                          if (previousValue != null) {
                            correctAnswers[subject] = previousValue + 1;
                          }
                        } else {
                          falseAns++;
                          var previousValue = wrongAnswers[subject];
                          if (previousValue != null) {
                            wrongAnswers[subject] = previousValue + 1;
                          }
                        }
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              trueAns: correctAns,
                              falseAns: falseAns,
                              totalQuestions: widget.quizQuestions.length,
                              quizQuestion: widget.quizQuestions,
                              align: align,
                              correctAnswers: correctAnswers,
                              wrongAnswers: wrongAnswers,
                            ),
                          ),
                        );
                      }
                      if (index < widget.quizQuestions.length - 1) {
                        String subject = widget.quizQuestions[index].subject;
                        if (selectedOption ==
                            widget.quizQuestions[index].answer.toString()) {
                          correctAns++;
                          var previousValue = correctAnswers[subject];
                          if (previousValue != null) {
                            correctAnswers[subject] = previousValue + 1;
                          }
                        } else {
                          falseAns++;
                          var previousValue = wrongAnswers[subject];
                          if (previousValue != null) {
                            wrongAnswers[subject] = previousValue + 1;
                          }
                        }
                        setState(() {
                          index++;
                          visible = false;
                          option = null;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Courgette",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
