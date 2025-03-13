import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/free_scan_flow/free_scan_component/free_scan_component_widget.dart';
import 'free_scan_page_widget.dart' show FreeScanPageWidget;
import 'package:flutter/material.dart';

class FreeScanPageModel extends FlutterFlowModel<FreeScanPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FreeScanComponent component.
  late FreeScanComponentModel freeScanComponentModel;

  @override
  void initState(BuildContext context) {
    freeScanComponentModel =
        createModel(context, () => FreeScanComponentModel());
  }

  @override
  void dispose() {
    freeScanComponentModel.dispose();
  }
}
