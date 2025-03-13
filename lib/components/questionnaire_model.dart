import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/why_it_matters_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'questionnaire_widget.dart' show QuestionnaireWidget;
import 'package:flutter/material.dart';

class QuestionnaireModel extends FlutterFlowModel<QuestionnaireWidget> {
  ///  Local state fields for this component.

  QuestionnaireStruct? question;
  void updateQuestionStruct(Function(QuestionnaireStruct) updateFn) {
    updateFn(question ??= QuestionnaireStruct());
  }

  List<QuestionnaireStruct> answeredQuestions = [];
  void addToAnsweredQuestions(QuestionnaireStruct item) =>
      answeredQuestions.add(item);
  void removeFromAnsweredQuestions(QuestionnaireStruct item) =>
      answeredQuestions.remove(item);
  void removeAtIndexFromAnsweredQuestions(int index) =>
      answeredQuestions.removeAt(index);
  void insertAtIndexInAnsweredQuestions(int index, QuestionnaireStruct item) =>
      answeredQuestions.insert(index, item);
  void updateAnsweredQuestionsAtIndex(
          int index, Function(QuestionnaireStruct) updateFn) =>
      answeredQuestions[index] = updateFn(answeredQuestions[index]);

  List<int> singleSlectionSelectedIndex = [];
  void addToSingleSlectionSelectedIndex(int item) =>
      singleSlectionSelectedIndex.add(item);
  void removeFromSingleSlectionSelectedIndex(int item) =>
      singleSlectionSelectedIndex.remove(item);
  void removeAtIndexFromSingleSlectionSelectedIndex(int index) =>
      singleSlectionSelectedIndex.removeAt(index);
  void insertAtIndexInSingleSlectionSelectedIndex(int index, int item) =>
      singleSlectionSelectedIndex.insert(index, item);
  void updateSingleSlectionSelectedIndexAtIndex(
          int index, Function(int) updateFn) =>
      singleSlectionSelectedIndex[index] =
          updateFn(singleSlectionSelectedIndex[index]);

  int index = 0;

  bool doSubmit = false;

  bool enableOtherText = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in Container widget.
  bool? canIsubmit2;
  // State field(s) for Answer widget.
  FocusNode? answerFocusNode;
  TextEditingController? answerTextController;
  String? Function(BuildContext, String?)? answerTextControllerValidator;
  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in Answer widget.
  bool? canIsubmit2Copyy;
  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in Answer widget.
  bool? canIsubmit2CopyyCopy;
  // Stores action output result for [Custom Action - updateSelectedIndex] action in Container widget.
  List<int>? updatedIndex;
  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in Container widget.
  bool? canIsubmit22244;
  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in Container widget.
  bool? canIsubmit2224455;
  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in Container widget.
  bool? canIsubmit222;
  // State field(s) for OtherText widget.
  FocusNode? otherTextFocusNode;
  TextEditingController? otherTextTextController;
  String? Function(BuildContext, String?)? otherTextTextControllerValidator;
  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in OtherText widget.
  bool? canIsubmit443;
  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in OtherText widget.
  bool? canIsubmit444;
  // Model for WhyItMatters component.
  late WhyItMattersModel whyItMattersModel;
  // Stores action output result for [Backend Call - API (submitQuestions)] action in Button widget.
  ApiCallResponse? apiResult864;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResultccf;
  // Stores action output result for [Custom Action - areAllQuestionsSelected] action in Button widget.
  bool? canIsubmit1;

  @override
  void initState(BuildContext context) {
    whyItMattersModel = createModel(context, () => WhyItMattersModel());
  }

  @override
  void dispose() {
    answerFocusNode?.dispose();
    answerTextController?.dispose();

    otherTextFocusNode?.dispose();
    otherTextTextController?.dispose();

    whyItMattersModel.dispose();
  }
}
