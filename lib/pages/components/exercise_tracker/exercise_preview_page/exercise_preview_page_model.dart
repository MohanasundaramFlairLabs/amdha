import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/index.dart';
import 'exercise_preview_page_widget.dart' show ExercisePreviewPageWidget;
import 'package:flutter/material.dart';

class ExercisePreviewPageModel
    extends FlutterFlowModel<ExercisePreviewPageWidget> {
  ///  Local state fields for this page.

  List<ExerciseDataStruct> exerciseListData = [];
  void addToExerciseListData(ExerciseDataStruct item) =>
      exerciseListData.add(item);
  void removeFromExerciseListData(ExerciseDataStruct item) =>
      exerciseListData.remove(item);
  void removeAtIndexFromExerciseListData(int index) =>
      exerciseListData.removeAt(index);
  void insertAtIndexInExerciseListData(int index, ExerciseDataStruct item) =>
      exerciseListData.insert(index, item);
  void updateExerciseListDataAtIndex(
          int index, Function(ExerciseDataStruct) updateFn) =>
      exerciseListData[index] = updateFn(exerciseListData[index]);

  ///  State fields for stateful widgets in this page.

  // Model for NoDataComponent component.
  late NoDataComponentModel noDataComponentModel;
  // Stores action output result for [Custom Action - getLocalTimeZone] action in Button widget.
  String? tz;
  // Stores action output result for [Backend Call - API (SubmitExerciseTracker)] action in Button widget.
  ApiCallResponse? apiResult58n;

  @override
  void initState(BuildContext context) {
    noDataComponentModel = createModel(context, () => NoDataComponentModel());
  }

  @override
  void dispose() {
    noDataComponentModel.dispose();
  }
}
