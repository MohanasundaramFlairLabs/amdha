import '/backend/api_requests/api_calls.dart';
import '/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_vitals_component_widget.dart' show AddVitalsComponentWidget;
import 'package:flutter/material.dart';

class AddVitalsComponentModel
    extends FlutterFlowModel<AddVitalsComponentWidget> {
  ///  Local state fields for this component.

  String? selectedVital;

  bool enableSubmitButton = true;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for DropDownField component.
  late DropDownFieldModel dropDownFieldModel;
  // State field(s) for EnteredVital widget.
  FocusNode? enteredVitalFocusNode;
  TextEditingController? enteredVitalTextController;
  String? Function(BuildContext, String?)? enteredVitalTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (addVitals)] action in Button widget.
  ApiCallResponse? apiResultsgw;

  @override
  void initState(BuildContext context) {
    dropDownFieldModel = createModel(context, () => DropDownFieldModel());
  }

  @override
  void dispose() {
    dropDownFieldModel.dispose();
    enteredVitalFocusNode?.dispose();
    enteredVitalTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
