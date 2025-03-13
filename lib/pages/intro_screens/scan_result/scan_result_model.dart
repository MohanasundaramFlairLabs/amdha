import '/components/vital_home_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_result_widget.dart' show ScanResultWidget;
import 'package:flutter/material.dart';

class ScanResultModel extends FlutterFlowModel<ScanResultWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for VitalHomeComponent component.
  late VitalHomeComponentModel vitalHomeComponentModel;

  @override
  void initState(BuildContext context) {
    vitalHomeComponentModel =
        createModel(context, () => VitalHomeComponentModel());
  }

  @override
  void dispose() {
    vitalHomeComponentModel.dispose();
  }
}
