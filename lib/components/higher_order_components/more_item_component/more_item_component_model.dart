import '/components/higher_order_components/list_file_component/list_file_component_widget.dart';
import '/components/micro_components/menu_components/menu_card/menu_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'more_item_component_widget.dart' show MoreItemComponentWidget;
import 'package:flutter/material.dart';

class MoreItemComponentModel extends FlutterFlowModel<MoreItemComponentWidget> {
  ///  Local state fields for this component.

  bool? isFirstChild;

  String? selectedIndex;

  ///  State fields for stateful widgets in this component.

  // Model for MenuCard component.
  late MenuCardModel menuCardModel1;
  // Model for MenuCard component.
  late MenuCardModel menuCardModel2;
  // Model for MenuCard component.
  late MenuCardModel menuCardModel3;
  // Model for ListFileComponent component.
  late ListFileComponentModel listFileComponentModel;

  @override
  void initState(BuildContext context) {
    menuCardModel1 = createModel(context, () => MenuCardModel());
    menuCardModel2 = createModel(context, () => MenuCardModel());
    menuCardModel3 = createModel(context, () => MenuCardModel());
    listFileComponentModel =
        createModel(context, () => ListFileComponentModel());
  }

  @override
  void dispose() {
    menuCardModel1.dispose();
    menuCardModel2.dispose();
    menuCardModel3.dispose();
    listFileComponentModel.dispose();
  }
}
