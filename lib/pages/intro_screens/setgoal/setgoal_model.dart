import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_vitals_component_widget.dart';
import '/components/graph_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'setgoal_widget.dart' show SetgoalWidget;
import 'package:flutter/material.dart';

class SetgoalModel extends FlutterFlowModel<SetgoalWidget> {
  ///  Local state fields for this page.

  bool goalSeted = false;

  bool refresh = false;

  bool isEditVital = false;

  VitalsStruct? vitalToEdit;
  void updateVitalToEditStruct(Function(VitalsStruct) updateFn) {
    updateFn(vitalToEdit ??= VitalsStruct());
  }

  bool isAddVital = false;

  int? deleteSelectedIndex;

  ///  State fields for stateful widgets in this page.

  // Model for GraphComponent component.
  late GraphComponentModel graphComponentModel;
  // Stores action output result for [Backend Call - API (deleteVital)] action in Button widget.
  ApiCallResponse? apiResultlbzCopy;
  // Model for AddVitalsComponent component.
  late AddVitalsComponentModel addVitalsComponentModel;

  @override
  void initState(BuildContext context) {
    graphComponentModel = createModel(context, () => GraphComponentModel());
    addVitalsComponentModel =
        createModel(context, () => AddVitalsComponentModel());
  }

  @override
  void dispose() {
    graphComponentModel.dispose();
    addVitalsComponentModel.dispose();
  }
}
