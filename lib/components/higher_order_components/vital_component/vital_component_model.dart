import '/backend/schema/structs/index.dart';
import '/components/add_vitals_component_widget.dart';
import '/components/higher_order_components/scan_form/scan_form_widget.dart';
import '/components/higher_order_components/scan_form_two/scan_form_two_widget.dart';
import '/components/micro_components/vitals_component/scan_results/scan_results_widget.dart';
import '/components/vital_home_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vital_component_widget.dart' show VitalComponentWidget;
import 'package:flutter/material.dart';

class VitalComponentModel extends FlutterFlowModel<VitalComponentWidget> {
  ///  Local state fields for this component.

  bool isFirstChild = true;

  bool? isScanPage;

  bool? isScanSecondPage;

  bool? isWebView;

  String? posture;

  String? scanType;

  DateTime? dob;

  int? height;

  int? weight;

  String? gender;

  bool? isSecondChild;

  bool? scanResults;

  List<VitalsStruct> scannedVitals = [];
  void addToScannedVitals(VitalsStruct item) => scannedVitals.add(item);
  void removeFromScannedVitals(VitalsStruct item) => scannedVitals.remove(item);
  void removeAtIndexFromScannedVitals(int index) =>
      scannedVitals.removeAt(index);
  void insertAtIndexInScannedVitals(int index, VitalsStruct item) =>
      scannedVitals.insert(index, item);
  void updateScannedVitalsAtIndex(int index, Function(VitalsStruct) updateFn) =>
      scannedVitals[index] = updateFn(scannedVitals[index]);

  VitalsStruct? selectedVital;
  void updateSelectedVitalStruct(Function(VitalsStruct) updateFn) {
    updateFn(selectedVital ??= VitalsStruct());
  }

  bool? isEdit;

  ///  State fields for stateful widgets in this component.

  // Model for VitalHomeComponent component.
  late VitalHomeComponentModel vitalHomeComponentModel;
  // Model for AddVitalsComponent component.
  late AddVitalsComponentModel addVitalsComponentModel;
  // Model for ScanForm component.
  late ScanFormModel scanFormModel;
  // Model for ScanFormTwo component.
  late ScanFormTwoModel scanFormTwoModel;
  // Model for ScanResults component.
  late ScanResultsModel scanResultsModel;

  @override
  void initState(BuildContext context) {
    vitalHomeComponentModel =
        createModel(context, () => VitalHomeComponentModel());
    addVitalsComponentModel =
        createModel(context, () => AddVitalsComponentModel());
    scanFormModel = createModel(context, () => ScanFormModel());
    scanFormTwoModel = createModel(context, () => ScanFormTwoModel());
    scanResultsModel = createModel(context, () => ScanResultsModel());
  }

  @override
  void dispose() {
    vitalHomeComponentModel.dispose();
    addVitalsComponentModel.dispose();
    scanFormModel.dispose();
    scanFormTwoModel.dispose();
    scanResultsModel.dispose();
  }
}
