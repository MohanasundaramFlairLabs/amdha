import '/flutter_flow/flutter_flow_util.dart';
import 'exercise_preview_edit_component_widget.dart'
    show ExercisePreviewEditComponentWidget;
import 'package:flutter/material.dart';

class ExercisePreviewEditComponentModel
    extends FlutterFlowModel<ExercisePreviewEditComponentWidget> {
  ///  Local state fields for this component.

  DateTime? setDate;

  String? dateTime;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
