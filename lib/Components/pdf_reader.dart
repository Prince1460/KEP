import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PDFReader extends StatefulWidget {
  final String url;
  final String name;
  PDFReader({required this.url, required this.name});
  @override
  _PDFReaderState createState() => _PDFReaderState();
}

class _PDFReaderState extends State<PDFReader> {
  late PdfViewerController _pdfController;
  @override
  void initState() {
    _pdfController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text(widget.name),
          ),
          body: SfPdfViewer.network(widget.url,
            controller: _pdfController,
          )
      ),
    );
  }
}

