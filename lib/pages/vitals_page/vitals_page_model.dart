import '/components/higher_order_components/vital_component/vital_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vitals_page_widget.dart' show VitalsPageWidget;
import 'package:flutter/material.dart';

class VitalsPageModel extends FlutterFlowModel<VitalsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for VitalComponent component.
  late VitalComponentModel vitalComponentModel;

  @override
  void initState(BuildContext context) {
    vitalComponentModel = createModel(context, () => VitalComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    vitalComponentModel.dispose();
  }
}
