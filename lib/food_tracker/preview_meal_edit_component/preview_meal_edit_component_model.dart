import '/flutter_flow/flutter_flow_util.dart';
import 'preview_meal_edit_component_widget.dart'
    show PreviewMealEditComponentWidget;
import 'package:flutter/material.dart';

class PreviewMealEditComponentModel
    extends FlutterFlowModel<PreviewMealEditComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for foodItem widget.
  FocusNode? foodItemFocusNode;
  TextEditingController? foodItemTextController;
  String? Function(BuildContext, String?)? foodItemTextControllerValidator;
  // State field(s) for portion widget.
  FocusNode? portionFocusNode;
  TextEditingController? portionTextController;
  String? Function(BuildContext, String?)? portionTextControllerValidator;
  // State field(s) for portionSize widget.
  FocusNode? portionSizeFocusNode;
  TextEditingController? portionSizeTextController;
  String? Function(BuildContext, String?)? portionSizeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    foodItemFocusNode?.dispose();
    foodItemTextController?.dispose();

    portionFocusNode?.dispose();
    portionTextController?.dispose();

    portionSizeFocusNode?.dispose();
    portionSizeTextController?.dispose();
  }
}
