// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({
    super.key,
    this.width,
    this.height,
    required this.pdfpath,
    required this.isNetwork,
  });

  final double? width;
  final double? height;
  final String pdfpath;
  final bool isNetwork;

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  late Future<void> _pdfLoadFuture;

  @override
  void initState() {
    super.initState();
    _pdfLoadFuture = _loadPdf();
  }

  Future<void> _loadPdf() async {
    // Simulate a delay if needed to load the PDF
    if (widget.isNetwork) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _pdfLoadFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while the PDF is loading
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle errors if any
            return Center(
              child: Text('Error loading PDF'),
            );
          } else {
            // Load the appropriate PDF viewer based on the source
            return Container(
                height: widget.height,
                width: widget.width,
                child: widget.isNetwork
                    ? SfPdfViewer.network(widget.pdfpath,
                        enableHyperlinkNavigation: true)
                    : SfPdfViewer.asset(widget.pdfpath,
                        enableHyperlinkNavigation: true));
          }
        },
      ),
    );
  }
}
