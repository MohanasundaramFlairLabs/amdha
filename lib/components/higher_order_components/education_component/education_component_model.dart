import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/higher_order_components/education_preview_component/education_preview_component_widget.dart';
import '/components/micro_components/education_components/education_list_component/education_list_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  // Stores action output result for [Backend Call - API (education)] action in EducationComponent widget.
  ApiCallResponse? apiResultzex;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    educationListComponentModel.dispose();
    educationPreviewComponentModel.dispose();
  }
}
