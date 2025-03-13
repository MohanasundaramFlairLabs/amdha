import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/graph_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'graph_component_widget.dart' show GraphComponentWidget;
import 'package:flutter/material.dart';

class GraphComponentModel extends FlutterFlowModel<GraphComponentWidget> {
  ///  Local state fields for this component.

  VitalGraphStruct? vital;
  void updateVitalStruct(Function(VitalGraphStruct) updateFn) {
    updateFn(vital ??= VitalGraphStruct());
  }

  bool isLoaded = false;

  int filter = 7;

  DateTime? date;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (vitalGraph)] action in GraphComponent widget.
  ApiCallResponse? apiResult1p7;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for Graph component.
  late GraphModel graphModel;

  @override
  void initState(BuildContext context) {
    graphModel = createModel(context, () => GraphModel());
  }

  @override
  void dispose() {
    graphModel.dispose();
  }
}
