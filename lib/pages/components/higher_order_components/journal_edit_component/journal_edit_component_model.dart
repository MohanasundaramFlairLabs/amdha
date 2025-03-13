import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_edit_component_widget.dart' show JournalEditComponentWidget;
import 'package:flutter/material.dart';

class JournalEditComponentModel
    extends FlutterFlowModel<JournalEditComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for AnswerOne widget.
  FocusNode? answerOneFocusNode;
  TextEditingController? answerOneTextController;
  String? Function(BuildContext, String?)? answerOneTextControllerValidator;
  String? _answerOneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('\\\\*\\\\*(.*?)\\\\*\\\\*').hasMatch(val)) {
      return 'Invalid use of characters';
    }
    return null;
  }

  // State field(s) for AnswerTwo widget.
  FocusNode? answerTwoFocusNode;
  TextEditingController? answerTwoTextController;
  String? Function(BuildContext, String?)? answerTwoTextControllerValidator;
  // State field(s) for AnswerThree widget.
  FocusNode? answerThreeFocusNode;
  TextEditingController? answerThreeTextController;
  String? Function(BuildContext, String?)? answerThreeTextControllerValidator;
  // Stores action output result for [Backend Call - API (addJournal)] action in Button widget.
  ApiCallResponse? apiResultejh;

  @override
  void initState(BuildContext context) {
    answerOneTextControllerValidator = _answerOneTextControllerValidator;
  }

  @override
  void dispose() {
    answerOneFocusNode?.dispose();
    answerOneTextController?.dispose();

    answerTwoFocusNode?.dispose();
    answerTwoTextController?.dispose();

    answerThreeFocusNode?.dispose();
    answerThreeTextController?.dispose();
  }
}
