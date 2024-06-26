import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vital_home_component_widget.dart' show VitalHomeComponentWidget;
import 'package:flutter/material.dart';

class VitalHomeComponentModel
    extends FlutterFlowModel<VitalHomeComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (vitals)] action in VitalHomeComponent widget.
  ApiCallResponse? vitalResponse;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
