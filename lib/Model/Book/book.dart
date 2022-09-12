import 'package:firebase_storage/firebase_storage.dart';

class Book {
  late String title;
  late String url;
  Book();

  Future<ListResult> listBooks() {
    late Future<ListResult> futureFiles;
    futureFiles = FirebaseStorage.instance.ref('/books').listAll();
    return futureFiles;
  }
}
