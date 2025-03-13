import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/form_components/dropdown/dropdown_widget.dart';
import '/pages/components/micro_components/medication_components/single_form/single_form_widget.dart';
import 'single_form_dropdown_widget.dart' show SingleFormDropdownWidget;
import 'package:flutter/material.dart';

class SingleFormDropdownModel
    extends FlutterFlowModel<SingleFormDropdownWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SingleForm component.
  late SingleFormModel singleFormModel;
  // Model for UnitDropdown.
  late DropdownModel unitDropdownModel;

  @override
  void initState(BuildContext context) {
    singleFormModel = createModel(context, () => SingleFormModel());
    unitDropdownModel = createModel(context, () => DropdownModel());
  }

  @override
  void dispose() {
    singleFormModel.dispose();
    unitDropdownModel.dispose();
  }
}
