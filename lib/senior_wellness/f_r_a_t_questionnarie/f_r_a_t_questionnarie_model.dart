import '/components/questionnaire_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'f_r_a_t_questionnarie_widget.dart' show FRATQuestionnarieWidget;
import 'package:flutter/material.dart';

class FRATQuestionnarieModel extends FlutterFlowModel<FRATQuestionnarieWidget> {
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
