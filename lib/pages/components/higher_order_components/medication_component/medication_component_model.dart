import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/add_medication_component/add_medication_component_widget.dart';
import '/pages/components/shimmer_components/medication_shimmer/medication_shimmer_widget.dart';
import 'medication_component_widget.dart' show MedicationComponentWidget;
import 'package:flutter/material.dart';

class MedicationComponentModel
    extends FlutterFlowModel<MedicationComponentWidget> {
  ///  Local state fields for this component.

  bool isMedication = true;

  MedicationModelStruct? selectedItem;
  void updateSelectedItemStruct(Function(MedicationModelStruct) updateFn) {
    updateFn(selectedItem ??= MedicationModelStruct());
  }

  bool edit = false;

  bool focusChnage = false;

  bool isDataLoaded = false;

  MedicationsStruct? medicationList;
  void updateMedicationListStruct(Function(MedicationsStruct) updateFn) {
    updateFn(medicationList ??= MedicationsStruct());
  }

  int? deleteSelctedIndex;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (medication)] action in MedicationComponent widget.
  ApiCallResponse? medicationResponse;
  // Stores action output result for [Custom Action - getRemainderDates] action in MedicationComponent widget.
  List<RemainderStruct>? remaindersList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (medication)] action in MedicationCard widget.
  ApiCallResponse? medicationResponseDelete;
  // Model for MedicationShimmer component.
  late MedicationShimmerModel medicationShimmerModel;
  // Model for AddMedicationComponent component.
  late AddMedicationComponentModel addMedicationComponentModel;

  @override
  void initState(BuildContext context) {
    medicationShimmerModel =
        createModel(context, () => MedicationShimmerModel());
    addMedicationComponentModel =
        createModel(context, () => AddMedicationComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    medicationShimmerModel.dispose();
    addMedicationComponentModel.dispose();
  }
}
