import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mood_tracker_launch_widget.dart' show MoodTrackerLaunchWidget;
import 'package:flutter/material.dart';

class MoodTrackerLaunchModel extends FlutterFlowModel<MoodTrackerLaunchWidget> {
  ///  Local state fields for this page.

  List<String> selectedMoods = [];
  void addToSelectedMoods(String item) => selectedMoods.add(item);
  void removeFromSelectedMoods(String item) => selectedMoods.remove(item);
  void removeAtIndexFromSelectedMoods(int index) =>
      selectedMoods.removeAt(index);
  void insertAtIndexInSelectedMoods(int index, String item) =>
      selectedMoods.insert(index, item);
  void updateSelectedMoodsAtIndex(int index, Function(String) updateFn) =>
      selectedMoods[index] = updateFn(selectedMoods[index]);

  MoodTypeStruct? mood;
  void updateMoodStruct(Function(MoodTypeStruct) updateFn) {
    updateFn(mood ??= MoodTypeStruct());
  }

  bool firstPage = true;

  bool secondPage = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Backend Call - API (SubmitMoodTracker)] action in Button widget.
  ApiCallResponse? apiResultexk;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResulto25;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
