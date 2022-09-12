import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student {
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String profilePic;
  late String favoriteSubject;
  late String province;
  late String tazkiraNumber;

  Future<dynamic> register() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    CollectionReference users =
        FirebaseFirestore.instance.collection('Students');
    QuerySnapshot querySnapshot =
        await users.where('tazkiraNumber', isEqualTo: tazkiraNumber).get();

    if (querySnapshot.docs.isNotEmpty) {
      return 'Tazkira Number is already registered';
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String username = "";
      for (int i = 0; i < email.length; i++) {
        if (email[i] == "@") {
          break;
        }
        username += email[i];
      }
      users.doc(username).set({
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'favoriteSubject': favoriteSubject,
        'province': province,
        'profilePic': profilePic,
        'tazkiraNumber': tazkiraNumber,
      });

      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e;
    }
  }

  Future<List> getStudentData(String stuEmail) async {
    List studentData = [];
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('Students');
    QuerySnapshot querySnapshot =
        await _collectionRef.where('email', isEqualTo: stuEmail).get();
    studentData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(studentData);
    return studentData;
  }

  Future<dynamic> update() {
    String username = "";
    for (int i = 0; i < email.length; i++) {
      if (email[i] == "@") {
        break;
      }
      username += email[i];
    }
    CollectionReference students =
        FirebaseFirestore.instance.collection('Students');
    bool response = false;
    String errorMessage;
    return students.doc(username).update({
      'firstName': firstName,
      'lastName': lastName,
      'province': province,
      'favoriteSubject': favoriteSubject,
    }).then((value) {
      response = true;
    }).catchError((error) {
      errorMessage = error;
    });
  }

  Future<dynamic> login(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('email', email);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
