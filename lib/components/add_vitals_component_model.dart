import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_vitals_component_widget.dart' show AddVitalsComponentWidget;
import 'package:flutter/material.dart';

class AddVitalsComponentModel
    extends FlutterFlowModel<AddVitalsComponentWidget> {
  ///  Local state fields for this component.

  bool enableSubmitButton = true;

  DateTime? dateTime;

  List<VitalsStruct> listofGlucoseVitals = [];
  void addToListofGlucoseVitals(VitalsStruct item) =>
      listofGlucoseVitals.add(item);
  void removeFromListofGlucoseVitals(VitalsStruct item) =>
      listofGlucoseVitals.remove(item);
  void removeAtIndexFromListofGlucoseVitals(int index) =>
      listofGlucoseVitals.removeAt(index);
  void insertAtIndexInListofGlucoseVitals(int index, VitalsStruct item) =>
      listofGlucoseVitals.insert(index, item);
  void updateListofGlucoseVitalsAtIndex(
          int index, Function(VitalsStruct) updateFn) =>
      listofGlucoseVitals[index] = updateFn(listofGlucoseVitals[index]);

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for VitalDropDown widget.
  String? vitalDropDownValue;
  FormFieldController<String>? vitalDropDownValueController;
  // State field(s) for EnteredVital widget.
  FocusNode? enteredVitalFocusNode;
  TextEditingController? enteredVitalTextController;
  String? Function(BuildContext, String?)? enteredVitalTextControllerValidator;
  String? _enteredVitalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(?!0+\$)([1-9]\\d{0,4}(\\.\\d+)?|0\\.\\d*[1-9]\\d*)\$')
        .hasMatch(val)) {
      return 'Enter valid vital value';
    }
    return null;
  }

  // State field(s) for BPTF1 widget.
  FocusNode? bptf1FocusNode;
  TextEditingController? bptf1TextController;
  String? Function(BuildContext, String?)? bptf1TextControllerValidator;
  String? _bptf1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(?!0+\$)([1-9]\\d{0,4}(\\.\\d+)?|0\\.\\d*[1-9]\\d*)\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for BPTF2 widget.
  FocusNode? bptf2FocusNode;
  TextEditingController? bptf2TextController;
  String? Function(BuildContext, String?)? bptf2TextControllerValidator;
  String? _bptf2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(?!0+\$)([1-9]\\d{0,4}(\\.\\d+)?|0\\.\\d*[1-9]\\d*)\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for SleepTF1 widget.
  FocusNode? sleepTF1FocusNode;
  TextEditingController? sleepTF1TextController;
  String? Function(BuildContext, String?)? sleepTF1TextControllerValidator;
  String? _sleepTF1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 2) {
      return 'Maximum 2 digits are allowed';
    }

    return null;
  }

  // State field(s) for SleepTF2 widget.
  FocusNode? sleepTF2FocusNode;
  TextEditingController? sleepTF2TextController;
  String? Function(BuildContext, String?)? sleepTF2TextControllerValidator;
  String? _sleepTF2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '       ';
    }

    if (val.length < 0) {
      return '   ';
    }
    if (val.length > 2) {
      return '   ';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for NoteTextField widget.
  FocusNode? noteTextFieldFocusNode;
  TextEditingController? noteTextFieldTextController;
  String? Function(BuildContext, String?)? noteTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (UpdateVitalHistory)] action in Button widget.
  ApiCallResponse? apiResultsgqa;
  // Stores action output result for [Backend Call - API (addVitals)] action in Button widget.
  ApiCallResponse? apiResultsg;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResult3k7;
  // Stores action output result for [Backend Call - API (UpdateVitalHistory)] action in Button widget.
  ApiCallResponse? apiResultsgqa1;
  // Stores action output result for [Backend Call - API (addVitals)] action in Button widget.
  ApiCallResponse? apiResultsg222;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResult3;
  // Stores action output result for [Backend Call - API (UpdateVitalHistory)] action in Button widget.
  ApiCallResponse? apiResultsgqa1111;
  // Stores action output result for [Backend Call - API (addVitals)] action in Button widget.
  ApiCallResponse? apiResultsgwe12345;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResult322;
  // Stores action output result for [Backend Call - API (UpdateVitalHistory)] action in Button widget.
  ApiCallResponse? apiResultsgqa112233;
  // Stores action output result for [Backend Call - API (addVitals)] action in Button widget.
  ApiCallResponse? apiResultsgwe11111;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResult321kick;
  // Stores action output result for [Backend Call - API (UpdateVitalHistory)] action in Button widget.
  ApiCallResponse? apiResultsgqa11111;
  // Stores action output result for [Backend Call - API (addVitals)] action in Button widget.
  ApiCallResponse? apiResultsgwe;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResult321;
  // Stores action output result for [Backend Call - API (addBGVital)] action in Button widget.
  ApiCallResponse? apiResultvpd;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResultbbh;

  @override
  void initState(BuildContext context) {
    enteredVitalTextControllerValidator = _enteredVitalTextControllerValidator;
    bptf1TextControllerValidator = _bptf1TextControllerValidator;
    bptf2TextControllerValidator = _bptf2TextControllerValidator;
    sleepTF1TextControllerValidator = _sleepTF1TextControllerValidator;
    sleepTF2TextControllerValidator = _sleepTF2TextControllerValidator;
  }

  @override
  void dispose() {
    enteredVitalFocusNode?.dispose();
    enteredVitalTextController?.dispose();

    bptf1FocusNode?.dispose();
    bptf1TextController?.dispose();

    bptf2FocusNode?.dispose();
    bptf2TextController?.dispose();

    sleepTF1FocusNode?.dispose();
    sleepTF1TextController?.dispose();

    sleepTF2FocusNode?.dispose();
    sleepTF2TextController?.dispose();

    noteTextFieldFocusNode?.dispose();
    noteTextFieldTextController?.dispose();
  }
}
