import '/flutter_flow/flutter_flow_util.dart';
import 'single_form_widget.dart' show SingleFormWidget;
import 'package:flutter/material.dart';

class SingleFormModel extends FlutterFlowModel<SingleFormWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for EnteredValue widget.
  FocusNode? enteredValueFocusNode;
  TextEditingController? enteredValueTextController;
  String? Function(BuildContext, String?)? enteredValueTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enteredValueFocusNode?.dispose();
    enteredValueTextController?.dispose();
  }
}
