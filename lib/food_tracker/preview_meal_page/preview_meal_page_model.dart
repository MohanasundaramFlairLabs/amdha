import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/index.dart';
import 'preview_meal_page_widget.dart' show PreviewMealPageWidget;
import 'package:flutter/material.dart';

class PreviewMealPageModel extends FlutterFlowModel<PreviewMealPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NoDataComponent component.
  late NoDataComponentModel noDataComponentModel;
  // Stores action output result for [Custom Action - getLocalTimeZone] action in Button widget.
  String? tz;
  // Stores action output result for [Backend Call - API (SubmitFoodTracker)] action in Button widget.
  ApiCallResponse? apiResult7ha;

  @override
  void initState(BuildContext context) {
    noDataComponentModel = createModel(context, () => NoDataComponentModel());
  }

  @override
  void dispose() {
    noDataComponentModel.dispose();
  }
}
