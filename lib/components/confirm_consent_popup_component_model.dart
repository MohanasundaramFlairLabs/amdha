import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'confirm_consent_popup_component_widget.dart'
    show ConfirmConsentPopupComponentWidget;
import 'package:flutter/material.dart';

class ConfirmConsentPopupComponentModel
    extends FlutterFlowModel<ConfirmConsentPopupComponentWidget> {
  ///  Local state fields for this component.

  bool isAccepted = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
