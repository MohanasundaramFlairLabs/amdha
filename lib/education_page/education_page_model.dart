import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/education_component/education_component_widget.dart';
import 'education_page_widget.dart' show EducationPageWidget;
import 'package:flutter/material.dart';

class EducationPageModel extends FlutterFlowModel<EducationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EducationComponent component.
  late EducationComponentModel educationComponentModel;

  @override
  void initState(BuildContext context) {
    educationComponentModel =
        createModel(context, () => EducationComponentModel());
  }

  @override
  void dispose() {
    educationComponentModel.dispose();
  }
}
