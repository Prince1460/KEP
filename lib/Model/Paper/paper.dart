import 'package:firebase_storage/firebase_storage.dart';

class Paper {
  late String title;
  late String url;
  Paper();

  Future<ListResult> listPapers() {
    late Future<ListResult> futureFiles;
    futureFiles = FirebaseStorage.instance.ref('/papers').listAll();
    return futureFiles;
  }
}
