import 'package:flutter/material.dart';
import 'package:fyp/Components/theme_helper.dart';
import 'package:fyp/Model/Question/question.dart';
import 'package:fyp/Model/Result/result.dart';
import 'package:fyp/Screens/AsnwerScreen/asnwer_page.dart';
import 'package:fyp/constants.dart';
import 'package:pie_chart/pie_chart.dart';

class ResultPage extends StatefulWidget {
  final int trueAns;
  final int falseAns;
  final int totalQuestions;
  final TextAlign align;
  final List<Question> quizQuestion;
  final Map<String, int> correctAnswers;
  final Map<String, int> wrongAnswers;
  ResultPage({
    required this.trueAns,
    required this.falseAns,
    required this.totalQuestions,
    required this.quizQuestion,
    required this.align,
    required this.correctAnswers,
    required this.wrongAnswers,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Result result = Result();
  Map<String, double> dataMap = {};
  String resultMessage = "";
  @override
  void initState() {
    super.initState();
    setResultData();
  }

  void setResultData() {
    print(widget.correctAnswers);
    print(widget.wrongAnswers);
    setState(() {
      result.correct = widget.trueAns;
      result.wrong = widget.falseAns;
      result.total = widget.totalQuestions;
      dataMap = {
        "Correct": double.parse(result.getCorrectAns().toString()),
        "Wrong": double.parse(result.getWrongAns().toString()),
        "Not Attempted": double.parse(result.notAttempted().toString())
      };
      if (result.percentage() >= 33) {
        resultMessage = "PASS";
      } else {
        resultMessage = "FAIL";
      }
    });
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
          backgroundColor: primaryColor,
          title: const Text(
            'Result',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PieChart(
                  dataMap: dataMap,
                  chartRadius: MediaQuery.of(context).size.width / 2.5,
                  colorList: [Colors.green, Colors.red, Colors.orange],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'Result is ' + result.percentage().toStringAsFixed(2) + "%",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      fontFamily: 'Courgette'),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  resultMessage,
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      fontFamily: 'Courgette'),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: [
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Subject',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Correct',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Wrong',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Physics'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['Physics'].toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['Physics'].toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Chemistry'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['Chemistry']
                                  .toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['Chemistry'].toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Biology'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['Biology'].toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['Biology'].toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Maths'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['Maths'].toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['Maths'].toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Geography'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['Geography']
                                  .toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['Geography'].toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('General Know.'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['General Knowledge']
                                  .toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['General Knowledge']
                                  .toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Geology'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['Geology'].toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['Geology'].toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('History'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['History'].toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['History'].toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Islamic Stud.'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['IslamicStudies']
                                  .toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['IslamicStudies']
                                  .toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Pashto'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['Pashto'].toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['Pashto'].toString()),
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: const [
                              Text('Dari'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.correctAnswers['Dari'].toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(widget.wrongAnswers['Dari'].toString()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(175.0),
                    border: TableBorder.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    children: [
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Correct',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                result.getCorrectAns().toString(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Wrong',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                result.getWrongAns().toString(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total MCQ\'s',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                result.getTotalQuestions().toString(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(
                        'Answer Sheet',
                        style: TextStyle(
                          fontFamily: 'Courgette',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnswerPage(
                            quizQuestions: widget.quizQuestion,
                            align: widget.align,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
