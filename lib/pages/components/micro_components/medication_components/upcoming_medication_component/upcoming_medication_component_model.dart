import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'upcoming_medication_component_widget.dart'
    show UpcomingMedicationComponentWidget;
import 'package:flutter/material.dart';

class UpcomingMedicationComponentModel
    extends FlutterFlowModel<UpcomingMedicationComponentWidget> {
  ///  Local state fields for this component.

  MedicationsStruct? upcomingMedications;
  void updateUpcomingMedicationsStruct(Function(MedicationsStruct) updateFn) {
    updateFn(upcomingMedications ??= MedicationsStruct());
  }

  List<MedicationModelStruct> medications = [];
  void addToMedications(MedicationModelStruct item) => medications.add(item);
  void removeFromMedications(MedicationModelStruct item) =>
      medications.remove(item);
  void removeAtIndexFromMedications(int index) => medications.removeAt(index);
  void insertAtIndexInMedications(int index, MedicationModelStruct item) =>
      medications.insert(index, item);
  void updateMedicationsAtIndex(
          int index, Function(MedicationModelStruct) updateFn) =>
      medications[index] = updateFn(medications[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (upcomingMedication)] action in UpcomingMedicationComponent widget.
  ApiCallResponse? medicationList;
  // Stores action output result for [Custom Action - getRemainderDates] action in UpcomingMedicationComponent widget.
  List<RemainderStruct>? remainderMedications;
  // Stores action output result for [Backend Call - API (getMedicationById)] action in UpcomingMedicationCard widget.
  ApiCallResponse? apiResultwl9;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
