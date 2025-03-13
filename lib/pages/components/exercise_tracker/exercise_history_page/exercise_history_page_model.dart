import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'exercise_history_page_widget.dart' show ExerciseHistoryPageWidget;
import 'package:flutter/material.dart';

class ExerciseHistoryPageModel
    extends FlutterFlowModel<ExerciseHistoryPageWidget> {
  ///  Local state fields for this page.

  bool? isSet;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetExerciseData)] action in ExerciseHistoryPage widget.
  ApiCallResponse? apiResultan4;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (GetExerciseData)] action in Text widget.
  ApiCallResponse? apiResultkwe;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
