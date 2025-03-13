import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/vitals_component/diabetes_component/diabetes_component_widget.dart';
import 'vitals_card_widget.dart' show VitalsCardWidget;
import 'package:flutter/material.dart';

class VitalsCardModel extends FlutterFlowModel<VitalsCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DiabetesComponent component.
  late DiabetesComponentModel diabetesComponentModel;

  @override
  void initState(BuildContext context) {
    diabetesComponentModel =
        createModel(context, () => DiabetesComponentModel());
  }

  @override
  void dispose() {
    diabetesComponentModel.dispose();
  }
}
