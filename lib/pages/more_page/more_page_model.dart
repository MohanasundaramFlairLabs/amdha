import '/components/higher_order_components/more_item_component/more_item_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'more_page_widget.dart' show MorePageWidget;
import 'package:flutter/material.dart';

class MorePageModel extends FlutterFlowModel<MorePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MoreItemComponent component.
  late MoreItemComponentModel moreItemComponentModel;

  @override
  void initState(BuildContext context) {
    moreItemComponentModel =
        createModel(context, () => MoreItemComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    moreItemComponentModel.dispose();
  }
}
