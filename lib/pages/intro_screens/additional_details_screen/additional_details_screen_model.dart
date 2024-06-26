import '/components/micro_components/medication_components/date_pick/date_pick_widget.dart';
import '/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/components/micro_components/medication_components/single_form/single_form_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'additional_details_screen_widget.dart'
    show AdditionalDetailsScreenWidget;
import 'package:flutter/material.dart';

class AdditionalDetailsScreenModel
    extends FlutterFlowModel<AdditionalDetailsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DatePick component.
  late DatePickModel datePickModel;
  // Model for SingleForm component.
  late SingleFormModel singleFormModel1;
  // Model for SingleForm component.
  late SingleFormModel singleFormModel2;
  // Model for SingleForm component.
  late SingleFormModel singleFormModel3;
  // Model for DropDownField component.
  late DropDownFieldModel dropDownFieldModel;

  @override
  void initState(BuildContext context) {
    datePickModel = createModel(context, () => DatePickModel());
    singleFormModel1 = createModel(context, () => SingleFormModel());
    singleFormModel2 = createModel(context, () => SingleFormModel());
    singleFormModel3 = createModel(context, () => SingleFormModel());
    dropDownFieldModel = createModel(context, () => DropDownFieldModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    datePickModel.dispose();
    singleFormModel1.dispose();
    singleFormModel2.dispose();
    singleFormModel3.dispose();
    dropDownFieldModel.dispose();
  }
}
