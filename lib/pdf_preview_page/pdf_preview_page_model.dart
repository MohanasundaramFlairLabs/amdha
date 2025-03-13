import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pdf_preview_page_widget.dart' show PdfPreviewPageWidget;
import 'package:flutter/material.dart';

class PdfPreviewPageModel extends FlutterFlowModel<PdfPreviewPageWidget> {
  ///  Local state fields for this page.

  bool isTaskCompleted = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (Submittask)] action in Checkbox widget.
  ApiCallResponse? submitTask;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
