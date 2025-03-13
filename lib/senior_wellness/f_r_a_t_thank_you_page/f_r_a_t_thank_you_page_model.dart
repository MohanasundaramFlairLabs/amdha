import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'f_r_a_t_thank_you_page_widget.dart' show FRATThankYouPageWidget;
import 'package:flutter/material.dart';

class FRATThankYouPageModel extends FlutterFlowModel<FRATThankYouPageWidget> {
  ///  Local state fields for this page.

  RecommendationModelStruct? recommendationModel;
  void updateRecommendationModelStruct(
      Function(RecommendationModelStruct) updateFn) {
    updateFn(recommendationModel ??= RecommendationModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetRecommendation)] action in FRATThankYouPage widget.
  ApiCallResponse? fratRecommendationResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
