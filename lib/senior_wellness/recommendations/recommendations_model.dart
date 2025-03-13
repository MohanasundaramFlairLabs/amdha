import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recommendations_widget.dart' show RecommendationsWidget;
import 'package:flutter/material.dart';

class RecommendationsModel extends FlutterFlowModel<RecommendationsWidget> {
  ///  Local state fields for this page.

  List<RecommendationStruct> recommendationList = [];
  void addToRecommendationList(RecommendationStruct item) =>
      recommendationList.add(item);
  void removeFromRecommendationList(RecommendationStruct item) =>
      recommendationList.remove(item);
  void removeAtIndexFromRecommendationList(int index) =>
      recommendationList.removeAt(index);
  void insertAtIndexInRecommendationList(
          int index, RecommendationStruct item) =>
      recommendationList.insert(index, item);
  void updateRecommendationListAtIndex(
          int index, Function(RecommendationStruct) updateFn) =>
      recommendationList[index] = updateFn(recommendationList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
