import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/dashboard_component/circular_progress_bar/circular_progress_bar_widget.dart';
import 'wellbeing_component_widget.dart' show WellbeingComponentWidget;
import 'package:flutter/material.dart';

class WellbeingComponentModel
    extends FlutterFlowModel<WellbeingComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CircularProgressBar component.
  late CircularProgressBarModel circularProgressBarModel;

  @override
  void initState(BuildContext context) {
    circularProgressBarModel =
        createModel(context, () => CircularProgressBarModel());
  }

  @override
  void dispose() {
    circularProgressBarModel.dispose();
  }
}
