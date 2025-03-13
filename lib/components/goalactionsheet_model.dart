import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goalactionsheet_widget.dart' show GoalactionsheetWidget;
import 'package:flutter/material.dart';

class GoalactionsheetModel extends FlutterFlowModel<GoalactionsheetWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for EnteredVital widget.
  FocusNode? enteredVitalFocusNode1;
  TextEditingController? enteredVitalTextController1;
  String? Function(BuildContext, String?)? enteredVitalTextController1Validator;
  String? _enteredVitalTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(?!0+\$)([1-9]\\d{0,4}(\\.\\d+)?|0\\.\\d*[1-9]\\d*)\$')
        .hasMatch(val)) {
      return 'Enter valid value';
    }
    return null;
  }

  // State field(s) for EnteredVital widget.
  FocusNode? enteredVitalFocusNode2;
  TextEditingController? enteredVitalTextController2;
  String? Function(BuildContext, String?)? enteredVitalTextController2Validator;
  String? _enteredVitalTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(?!0+\$)([1-9]\\d{0,4}(\\.\\d+)?|0\\.\\d*[1-9]\\d*)\$')
        .hasMatch(val)) {
      return 'Enter valid value';
    }
    return null;
  }

  // State field(s) for EnteredVital widget.
  FocusNode? enteredVitalFocusNode3;
  TextEditingController? enteredVitalTextController3;
  String? Function(BuildContext, String?)? enteredVitalTextController3Validator;
  String? _enteredVitalTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(?!0+\$)([1-9]\\d{0,4}(\\.\\d+)?|0\\.\\d*[1-9]\\d*)\$')
        .hasMatch(val)) {
      return 'Enter valid value';
    }
    return null;
  }

  // State field(s) for EnteredVital widget.
  FocusNode? enteredVitalFocusNode4;
  TextEditingController? enteredVitalTextController4;
  String? Function(BuildContext, String?)? enteredVitalTextController4Validator;
  String? _enteredVitalTextController4Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 2) {
      return 'Only 2 digits are allowed';
    }

    return null;
  }

  // State field(s) for EnteredVital widget.
  FocusNode? enteredVitalFocusNode5;
  TextEditingController? enteredVitalTextController5;
  String? Function(BuildContext, String?)? enteredVitalTextController5Validator;
  // Stores action output result for [Backend Call - API (setGoal)] action in Button widget.
  ApiCallResponse? apiResult17ys;
  // Stores action output result for [Backend Call - API (setGoal)] action in Button widget.
  ApiCallResponse? apiResult17ysaa;
  // Stores action output result for [Backend Call - API (setGoal)] action in Button widget.
  ApiCallResponse? apiResult17ya;
  // Stores action output result for [Backend Call - API (updateVitalGoal)] action in Button widget.
  ApiCallResponse? apiResult11;
  // Stores action output result for [Backend Call - API (updateVitalGoal)] action in Button widget.
  ApiCallResponse? apiResult1111;
  // Stores action output result for [Backend Call - API (updateVitalGoal)] action in Button widget.
  ApiCallResponse? apiResult34;

  @override
  void initState(BuildContext context) {
    enteredVitalTextController1Validator =
        _enteredVitalTextController1Validator;
    enteredVitalTextController2Validator =
        _enteredVitalTextController2Validator;
    enteredVitalTextController3Validator =
        _enteredVitalTextController3Validator;
    enteredVitalTextController4Validator =
        _enteredVitalTextController4Validator;
  }

  @override
  void dispose() {
    enteredVitalFocusNode1?.dispose();
    enteredVitalTextController1?.dispose();

    enteredVitalFocusNode2?.dispose();
    enteredVitalTextController2?.dispose();

    enteredVitalFocusNode3?.dispose();
    enteredVitalTextController3?.dispose();

    enteredVitalFocusNode4?.dispose();
    enteredVitalTextController4?.dispose();

    enteredVitalFocusNode5?.dispose();
    enteredVitalTextController5?.dispose();
  }
}
