import '/backend/api_requests/api_calls.dart';
import '/components/questionnaire_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'w_h_o_questionarie_widget.dart' show WHOQuestionarieWidget;
import 'package:flutter/material.dart';

class WHOQuestionarieModel extends FlutterFlowModel<WHOQuestionarieWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Questionnaire component.
  late QuestionnaireModel questionnaireModel;
  // Stores action output result for [Backend Call - API (GetRecommendation)] action in Questionnaire widget.
  ApiCallResponse? apiResultiv1;

  @override
  void initState(BuildContext context) {
    questionnaireModel = createModel(context, () => QuestionnaireModel());
  }

  @override
  void dispose() {
    questionnaireModel.dispose();
  }
}
