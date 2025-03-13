import '/components/questionnaire_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_questionarie_widget.dart' show OnboardingQuestionarieWidget;
import 'package:flutter/material.dart';

class OnboardingQuestionarieModel
    extends FlutterFlowModel<OnboardingQuestionarieWidget> {
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
