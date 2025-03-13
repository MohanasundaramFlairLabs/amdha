import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'scan_form_widget.dart' show ScanFormWidget;
import 'package:flutter/material.dart';

class ScanFormModel extends FlutterFlowModel<ScanFormWidget> {
  ///  Local state fields for this component.

  DateTime? dob;

  String? height;

  String? weight;

  String gender = 'Male';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getProfile)] action in ScanForm widget.
  ApiCallResponse? userProfile;
  // State field(s) for Height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  String? _heightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(1000|[1-9][0-9]{0,2})\$').hasMatch(val)) {
      return 'Enter a valid value';
    }
    return null;
  }

  // State field(s) for Weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  String? _weightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(1000|[1-9][0-9]{0,2})\$').hasMatch(val)) {
      return 'Enter a valid value';
    }
    return null;
  }

  // State field(s) for GenderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // Stores action output result for [Backend Call - API (updateProfile)] action in Button widget.
  ApiCallResponse? updateProfileResponse;

  @override
  void initState(BuildContext context) {
    heightTextControllerValidator = _heightTextControllerValidator;
    weightTextControllerValidator = _weightTextControllerValidator;
  }

  @override
  void dispose() {
    heightFocusNode?.dispose();
    heightTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();
  }
}
