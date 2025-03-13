import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/add_medication_component/add_medication_component_widget.dart';
import 'edit_medication_widget.dart' show EditMedicationWidget;
import 'package:flutter/material.dart';

class EditMedicationModel extends FlutterFlowModel<EditMedicationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AddMedicationComponent component.
  late AddMedicationComponentModel addMedicationComponentModel;

  @override
  void initState(BuildContext context) {
    addMedicationComponentModel =
        createModel(context, () => AddMedicationComponentModel());
  }

  @override
  void dispose() {
    addMedicationComponentModel.dispose();
  }
}
