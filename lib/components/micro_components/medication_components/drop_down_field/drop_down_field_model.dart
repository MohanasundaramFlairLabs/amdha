import '/components/micro_components/form_components/dropdown/dropdown_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'drop_down_field_widget.dart' show DropDownFieldWidget;
import 'package:flutter/material.dart';

class DropDownFieldModel extends FlutterFlowModel<DropDownFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Dropdown component.
  late DropdownModel dropdownModel;

  @override
  void initState(BuildContext context) {
    dropdownModel = createModel(context, () => DropdownModel());
  }

  @override
  void dispose() {
    dropdownModel.dispose();
  }
}
