import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/education_preview_component/education_preview_component_widget.dart';
import '/pages/components/micro_components/education_components/education_list_component/education_list_component_widget.dart';
import 'education_component_widget.dart' show EducationComponentWidget;
import 'package:flutter/material.dart';

class EducationComponentModel
    extends FlutterFlowModel<EducationComponentWidget> {
  ///  Local state fields for this component.

  bool? isFirstChild;

  ItemsStruct? selectedEducation;
  void updateSelectedEducationStruct(Function(ItemsStruct) updateFn) {
    updateFn(selectedEducation ??= ItemsStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Model for EducationListComponent component.
  late EducationListComponentModel educationListComponentModel;
  // Model for EducationPreviewComponent component.
  late EducationPreviewComponentModel educationPreviewComponentModel;

  @override
  void initState(BuildContext context) {
    educationListComponentModel =
        createModel(context, () => EducationListComponentModel());
    educationPreviewComponentModel =
        createModel(context, () => EducationPreviewComponentModel());
  }

  @override
  void dispose() {
    educationListComponentModel.dispose();
    educationPreviewComponentModel.dispose();
  }
}
