import '/components/micro_components/vitals_component/vital_card/vital_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goal_component_widget.dart' show GoalComponentWidget;
import 'package:flutter/material.dart';

class GoalComponentModel extends FlutterFlowModel<GoalComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for VitalCard component.
  late VitalCardModel vitalCardModel;

  @override
  void initState(BuildContext context) {
    vitalCardModel = createModel(context, () => VitalCardModel());
  }

  @override
  void dispose() {
    vitalCardModel.dispose();
  }
}
