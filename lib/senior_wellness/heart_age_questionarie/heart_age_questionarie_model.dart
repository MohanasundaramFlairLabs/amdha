import '/components/questionnaire_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'heart_age_questionarie_widget.dart' show HeartAgeQuestionarieWidget;
import 'package:flutter/material.dart';

class HeartAgeQuestionarieModel
    extends FlutterFlowModel<HeartAgeQuestionarieWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Questionnaire component.
  late QuestionnaireModel questionnaireModel;

  @override
  void initState(BuildContext context) {
    questionnaireModel = createModel(context, () => QuestionnaireModel());
  }

  @override
  void dispose() {
    questionnaireModel.dispose();
  }
}
