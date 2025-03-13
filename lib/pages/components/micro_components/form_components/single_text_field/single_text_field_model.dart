import '/flutter_flow/flutter_flow_util.dart';
import 'single_text_field_widget.dart' show SingleTextFieldWidget;
import 'package:flutter/material.dart';

class SingleTextFieldModel extends FlutterFlowModel<SingleTextFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
