import '/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/components/micro_components/note_component/note_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_form_two_widget.dart' show ScanFormTwoWidget;
import 'package:flutter/material.dart';

class ScanFormTwoModel extends FlutterFlowModel<ScanFormTwoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Posture.
  late DropDownFieldModel postureModel;
  // Model for ScanType.
  late DropDownFieldModel scanTypeModel;
  // Model for NoteComponent component.
  late NoteComponentModel noteComponentModel;

  @override
  void initState(BuildContext context) {
    postureModel = createModel(context, () => DropDownFieldModel());
    scanTypeModel = createModel(context, () => DropDownFieldModel());
    noteComponentModel = createModel(context, () => NoteComponentModel());
  }

  @override
  void dispose() {
    postureModel.dispose();
    scanTypeModel.dispose();
    noteComponentModel.dispose();
  }
}
