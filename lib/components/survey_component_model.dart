import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'survey_component_widget.dart' show SurveyComponentWidget;
import 'package:flutter/material.dart';

class SurveyComponentModel extends FlutterFlowModel<SurveyComponentWidget> {
  ///  Local state fields for this component.

  int index = 0;

  SurveyModelStruct? survey;
  void updateSurveyStruct(Function(SurveyModelStruct) updateFn) {
    updateFn(survey ??= SurveyModelStruct());
  }

  List<SurveyModelStruct> answeredSurveys = [];
  void addToAnsweredSurveys(SurveyModelStruct item) =>
      answeredSurveys.add(item);
  void removeFromAnsweredSurveys(SurveyModelStruct item) =>
      answeredSurveys.remove(item);
  void removeAtIndexFromAnsweredSurveys(int index) =>
      answeredSurveys.removeAt(index);
  void insertAtIndexInAnsweredSurveys(int index, SurveyModelStruct item) =>
      answeredSurveys.insert(index, item);
  void updateAnsweredSurveysAtIndex(
          int index, Function(SurveyModelStruct) updateFn) =>
      answeredSurveys[index] = updateFn(answeredSurveys[index]);

  int? singleSlectionSelectedIndex;

  bool disableAction = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetSurvey)] action in SurveyComponent widget.
  ApiCallResponse? surveyResponse;
  // State field(s) for Answer widget.
  FocusNode? answerFocusNode;
  TextEditingController? answerTextController;
  String? Function(BuildContext, String?)? answerTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    answerFocusNode?.dispose();
    answerTextController?.dispose();
  }
}
