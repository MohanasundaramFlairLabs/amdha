import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'video_call_summary_widget.dart' show VideoCallSummaryWidget;
import 'package:flutter/material.dart';

class VideoCallSummaryModel extends FlutterFlowModel<VideoCallSummaryWidget> {
  ///  Local state fields for this component.

  YourVisitsStruct? caseSheet;
  void updateCaseSheetStruct(Function(YourVisitsStruct) updateFn) {
    updateFn(caseSheet ??= YourVisitsStruct());
  }

  bool isPrescriptionReady = false;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (getCaseSummery)] action in VideoCallSummary widget.
  ApiCallResponse? apiResult9ti;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
