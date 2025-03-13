import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/free_next_component/free_next_component_widget.dart';
import 'free_scan_component_widget.dart' show FreeScanComponentWidget;
import 'package:flutter/material.dart';

class FreeScanComponentModel extends FlutterFlowModel<FreeScanComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for FreeNextComponent component.
  late FreeNextComponentModel freeNextComponentModel;

  @override
  void initState(BuildContext context) {
    freeNextComponentModel =
        createModel(context, () => FreeNextComponentModel());
  }

  @override
  void dispose() {
    freeNextComponentModel.dispose();
  }
}
