import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'journal_question_page_widget.dart' show JournalQuestionPageWidget;
import 'package:flutter/material.dart';

class JournalQuestionPageModel
    extends FlutterFlowModel<JournalQuestionPageWidget> {
  ///  Local state fields for this page.

  bool isTextFieldEmpty = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (addJournal)] action in Button widget.
  ApiCallResponse? apiResulthik;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResulto25;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
