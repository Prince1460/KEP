import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:translator/translator.dart';

class KankorGuide extends StatefulWidget {
  final String language;
  KankorGuide({required this.language});

  @override
  State<KankorGuide> createState() => _KankorGuideState();
}

class _KankorGuideState extends State<KankorGuide> {
  final translator = GoogleTranslator();
  String guide = "";
  TextAlign align = TextAlign.start;
  void convertData() async {
    String text =
        "Kankor is the nationwide tertiary entrance exam in Afghanistan. Passing the entrance exam to a university is a major step in one's life. Since the score on the Kankor assessment test determines the student's sequence of courses, it is highly recommended to do some test preparation so that the score and consequent placement are in the student's best interest. However, due to poverty and lack of public awareness, Afghanistan severely lacks sufficient resource for providing entrance test preparation facilities. Keeping the aforementioned in mind, mobile-base preparation systems offer greater flexibility than the conventional ways, as they can be accessed anywhere, anytime. In addition to using easily found practice materials, the online text preparation system is the most efficient, dynamic and relatively cheap method to prepare students for the qualifying test. In this paper, we propose the design of a mobile-based test preparation environment, known as ‘KEP or Kankor Exam preparation App’ to give students the tools to help them pass the university entrance exam on the first try.";
    var title =
        await translator.translate(text, from: 'en', to: widget.language);
    setState(() {
      guide = title.toString();
    });
    if (widget.language != 'en') {
      setState(() {
        align = TextAlign.end;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    convertData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          title: const Text(
            'Kankor Guide',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Courgette",
            ),
          ),
        ),
        body: Center(
          child: Container(
            height: size.height * 0.8,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                  guide,
                  textAlign: align,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Courgette",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
