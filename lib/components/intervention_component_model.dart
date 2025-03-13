import '/flutter_flow/flutter_flow_util.dart';
import 'intervention_component_widget.dart' show InterventionComponentWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class InterventionComponentModel
    extends FlutterFlowModel<InterventionComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
