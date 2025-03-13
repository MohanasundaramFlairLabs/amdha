import '/flutter_flow/flutter_flow_util.dart';
import 'text_input_popup_widget.dart' show TextInputPopupWidget;
import 'package:flutter/material.dart';

class TextInputPopupModel extends FlutterFlowModel<TextInputPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NewSymptom widget.
  final newSymptomKey = GlobalKey();
  FocusNode? newSymptomFocusNode;
  TextEditingController? newSymptomTextController;
  String? newSymptomSelectedOption;
  String? Function(BuildContext, String?)? newSymptomTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newSymptomFocusNode?.dispose();
  }
}
