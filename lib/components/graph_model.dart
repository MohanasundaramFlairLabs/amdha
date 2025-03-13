import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'graph_widget.dart' show GraphWidget;
import 'package:flutter/material.dart';

class GraphModel extends FlutterFlowModel<GraphWidget> {
  ///  Local state fields for this component.

  VitalGraphStruct? vital;
  void updateVitalStruct(Function(VitalGraphStruct) updateFn) {
    updateFn(vital ??= VitalGraphStruct());
  }

  bool isLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (vitalGraph)] action in Graph widget.
  ApiCallResponse? apiResult1p7;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
