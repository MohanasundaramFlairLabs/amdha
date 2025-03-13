import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_complete_message_widget.dart'
    show OnboardingCompleteMessageWidget;
import 'package:flutter/material.dart';

class OnboardingCompleteMessageModel
    extends FlutterFlowModel<OnboardingCompleteMessageWidget> {
  ///  Local state fields for this page.

  List<RecommendationStruct> recommendations = [];
  void addToRecommendations(RecommendationStruct item) =>
      recommendations.add(item);
  void removeFromRecommendations(RecommendationStruct item) =>
      recommendations.remove(item);
  void removeAtIndexFromRecommendations(int index) =>
      recommendations.removeAt(index);
  void insertAtIndexInRecommendations(int index, RecommendationStruct item) =>
      recommendations.insert(index, item);
  void updateRecommendationsAtIndex(
          int index, Function(RecommendationStruct) updateFn) =>
      recommendations[index] = updateFn(recommendations[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetRecommendation)] action in OnboardingCompleteMessage widget.
  ApiCallResponse? apiResultyjw;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
