import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_results_widget.dart' show ScanResultsWidget;
import 'package:flutter/material.dart';

class ScanResultsModel extends FlutterFlowModel<ScanResultsWidget> {
  ///  Local state fields for this component.

  List<VitalsStruct> vitals = [];
  void addToVitals(VitalsStruct item) => vitals.add(item);
  void removeFromVitals(VitalsStruct item) => vitals.remove(item);
  void removeAtIndexFromVitals(int index) => vitals.removeAt(index);
  void insertAtIndexInVitals(int index, VitalsStruct item) =>
      vitals.insert(index, item);
  void updateVitalsAtIndex(int index, Function(VitalsStruct) updateFn) =>
      vitals[index] = updateFn(vitals[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (vitals)] action in ScanResults widget.
  ApiCallResponse? vitalResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
