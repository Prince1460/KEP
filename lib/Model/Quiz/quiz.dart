import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp/Model/Question/question.dart';
import 'package:translator/translator.dart';

final translator = GoogleTranslator();

class Quiz {
  List<Question> quizQuestions = [];
  Quiz();

  Future<List> getQuiz(String subject, String language) async {
    QuerySnapshot querySnapshot;

    List allData = [];
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('questions');
    if (subject == 'all') {
      querySnapshot = await _collectionRef.get();
    } else {
      querySnapshot =
          await _collectionRef.where('subject', isEqualTo: subject).get();
    }
    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    allData.shuffle();
    List data = [];
    int len = 5;
    if (subject == 'all') {
      len = 20;
    }
    for (int i = 0; i < len; i++) {
      var title = await translator.translate(allData[i]['title'],
          from: 'en', to: language);
      allData[i]['title'] = await title.toString();
      var op1 = await translator.translate(allData[i]['option1'],
          from: 'en', to: language);
      allData[i]['option1'] = await op1.toString();
      var op2 = await translator.translate(allData[i]['option2'],
          from: 'en', to: language);
      allData[i]['option2'] = await op2.toString();
      var op3 = await translator.translate(allData[i]['option3'],
          from: 'en', to: language);
      allData[i]['option3'] = await op3.toString();
      var op4 = await translator.translate(allData[i]['option4'],
          from: 'en', to: language);
      allData[i]['option4'] = await op4.toString();
      var answer = await translator.translate(allData[i]['answer'],
          from: 'en', to: language);
      allData[i]['answer'] = await answer.toString();
      data.add(allData[i]);
    }
    for (int i = 0; i < data.length; i++) {
      Question question = Question(
        title: data[i]['title'],
        option1: data[i]['option1'],
        option2: data[i]['option2'],
        option3: data[i]['option3'],
        option4: data[i]['option4'],
        answer: data[i]['answer'],
        subject: data[i]['subject'],
      );
      quizQuestions.add(question);
    }
    return quizQuestions;
  }
}
