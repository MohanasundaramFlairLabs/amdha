import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/education_preview_component/education_preview_component_widget.dart';
import 'education_preview_widget.dart' show EducationPreviewWidget;
import 'package:flutter/material.dart';

class EducationPreviewModel extends FlutterFlowModel<EducationPreviewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EducationPreviewComponent component.
  late EducationPreviewComponentModel educationPreviewComponentModel;

  @override
  void initState(BuildContext context) {
    educationPreviewComponentModel =
        createModel(context, () => EducationPreviewComponentModel());
  }

  @override
  void dispose() {
    educationPreviewComponentModel.dispose();
  }
}
