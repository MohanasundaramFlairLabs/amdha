import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'severity_popup_widget.dart' show SeverityPopupWidget;
import 'package:flutter/material.dart';

class SeverityPopupModel extends FlutterFlowModel<SeverityPopupWidget> {
  ///  Local state fields for this component.

  List<SymptomsListStruct> symptoms = [];
  void addToSymptoms(SymptomsListStruct item) => symptoms.add(item);
  void removeFromSymptoms(SymptomsListStruct item) => symptoms.remove(item);
  void removeAtIndexFromSymptoms(int index) => symptoms.removeAt(index);
  void insertAtIndexInSymptoms(int index, SymptomsListStruct item) =>
      symptoms.insert(index, item);
  void updateSymptomsAtIndex(
          int index, Function(SymptomsListStruct) updateFn) =>
      symptoms[index] = updateFn(symptoms[index]);

  String? severitySelected;

  int? selectedIndex;

  DateTime? dateTime;

  String? duration;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for duration widget.
  FocusNode? durationFocusNode;
  TextEditingController? durationTextController;
  String? Function(BuildContext, String?)? durationTextControllerValidator;
  String? _durationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter duration';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    durationTextControllerValidator = _durationTextControllerValidator;
  }

  @override
  void dispose() {
    durationFocusNode?.dispose();
    durationTextController?.dispose();
  }
}
