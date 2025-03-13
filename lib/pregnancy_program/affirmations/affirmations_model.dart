import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'affirmations_widget.dart' show AffirmationsWidget;
import 'package:flutter/material.dart';

class AffirmationsModel extends FlutterFlowModel<AffirmationsWidget> {
  ///  Local state fields for this page.

  String? selectedValue;

  String? selectedOption;

  bool questionView = true;

  bool confirmView = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (SubmitAffirmations)] action in Button widget.
  ApiCallResponse? apiResultulv1;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResulto251;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
