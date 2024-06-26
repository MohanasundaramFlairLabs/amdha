import '/components/micro_components/form_components/checkbox/checkbox_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'multi_checkbox_widget.dart' show MultiCheckboxWidget;
import 'package:flutter/material.dart';

class MultiCheckboxModel extends FlutterFlowModel<MultiCheckboxWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Checkbox component.
  late CheckboxModel checkboxModel;

  @override
  void initState(BuildContext context) {
    checkboxModel = createModel(context, () => CheckboxModel());
  }

  @override
  void dispose() {
    checkboxModel.dispose();
  }
}
