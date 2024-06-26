import '/backend/schema/structs/index.dart';
import '/components/higher_order_components/add_medication_component/add_medication_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'medication_component_widget.dart' show MedicationComponentWidget;
import 'package:flutter/material.dart';

class MedicationComponentModel
    extends FlutterFlowModel<MedicationComponentWidget> {
  ///  Local state fields for this component.

  bool isMedication = true;

  MedicationListStruct? selectedItem;
  void updateSelectedItemStruct(Function(MedicationListStruct) updateFn) {
    updateFn(selectedItem ??= MedicationListStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for AddMedicationComponent component.
  late AddMedicationComponentModel addMedicationComponentModel;

  @override
  void initState(BuildContext context) {
    addMedicationComponentModel =
        createModel(context, () => AddMedicationComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    addMedicationComponentModel.dispose();
  }
}
