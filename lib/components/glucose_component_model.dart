import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'glucose_component_widget.dart' show GlucoseComponentWidget;
import 'package:flutter/material.dart';

class GlucoseComponentModel extends FlutterFlowModel<GlucoseComponentWidget> {
  ///  Local state fields for this component.

  DateTime? dateTime;

  VitalsStruct? vital;
  void updateVitalStruct(Function(VitalsStruct) updateFn) {
    updateFn(vital ??= VitalsStruct());
  }

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for GlucoseType widget.
  String? glucoseTypeValue;
  FormFieldController<String>? glucoseTypeValueController;
  // State field(s) for GlucoseValue widget.
  FocusNode? glucoseValueFocusNode;
  TextEditingController? glucoseValueTextController;
  String? Function(BuildContext, String?)? glucoseValueTextControllerValidator;
  String? _glucoseValueTextControllerValidator(
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

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for GlucoseNoteField widget.
  FocusNode? glucoseNoteFieldFocusNode;
  TextEditingController? glucoseNoteFieldTextController;
  String? Function(BuildContext, String?)?
      glucoseNoteFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    glucoseValueTextControllerValidator = _glucoseValueTextControllerValidator;
  }

  @override
  void dispose() {
    glucoseValueFocusNode?.dispose();
    glucoseValueTextController?.dispose();

    glucoseNoteFieldFocusNode?.dispose();
    glucoseNoteFieldTextController?.dispose();
  }
}
