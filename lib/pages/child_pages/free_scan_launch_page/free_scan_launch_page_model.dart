import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/free_scan_flow/free_scan_launch/free_scan_launch_widget.dart';
import 'free_scan_launch_page_widget.dart' show FreeScanLaunchPageWidget;
import 'package:flutter/material.dart';

class FreeScanLaunchPageModel
    extends FlutterFlowModel<FreeScanLaunchPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for freeScanLaunch component.
  late FreeScanLaunchModel freeScanLaunchModel;

  @override
  void initState(BuildContext context) {
    freeScanLaunchModel = createModel(context, () => FreeScanLaunchModel());
  }

  @override
  void dispose() {
    freeScanLaunchModel.dispose();
  }
}
