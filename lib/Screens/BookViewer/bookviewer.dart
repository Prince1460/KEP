import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Model/Book/book.dart';
import 'package:fyp/constants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp/Components/pdf_reader.dart';
import 'package:fyp/Screens/BooksScreen/book_screen.dart';

class BookViewer extends StatefulWidget {
  late String bookPath= '';
  late String subject='';
  BookViewer({required this.bookPath,required this.subject});

  @override
  State<BookViewer> createState() => _BookViewerState();
}

class _BookViewerState extends State<BookViewer> {
  Book book = Book();

  late Future<ListResult> futureFiles;
  @override
  void initState() {
    super.initState();
    futureFiles = book.listBooks();
  }



  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text(widget.subject),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: FutureBuilder<ListResult>(
          future: futureFiles,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final files = snapshot.data!.items;
              return ListView.builder(
                itemCount: files.length,
                itemBuilder: (BuildContext context, int index) {
                  final file = files[index];

                  return Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(
                          file.name,
                          style: TextStyle(color: primaryColor, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () async {
                                final url = await file.getDownloadURL();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PDFReader(
                                      url: url,
                                      name: file.name,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                "Read",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error Loading Books'));
            } else {
              return Center(
                child: SpinKitSpinningLines(
                  color: primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
