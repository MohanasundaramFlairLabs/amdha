import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'meal_history_page_widget.dart' show MealHistoryPageWidget;
import 'package:flutter/material.dart';

class MealHistoryPageModel extends FlutterFlowModel<MealHistoryPageWidget> {
  ///  Local state fields for this page.

  bool hasHistory = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetFoodTracker)] action in MealHistoryPage widget.
  ApiCallResponse? apiResult7haCopy;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
