import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goal_component_widget.dart' show GoalComponentWidget;
import 'package:flutter/material.dart';

class GoalComponentModel extends FlutterFlowModel<GoalComponentWidget> {
  ///  Local state fields for this component.

  List<VitalsStruct> listOfGoals = [];
  void addToListOfGoals(VitalsStruct item) => listOfGoals.add(item);
  void removeFromListOfGoals(VitalsStruct item) => listOfGoals.remove(item);
  void removeAtIndexFromListOfGoals(int index) => listOfGoals.removeAt(index);
  void insertAtIndexInListOfGoals(int index, VitalsStruct item) =>
      listOfGoals.insert(index, item);
  void updateListOfGoalsAtIndex(int index, Function(VitalsStruct) updateFn) =>
      listOfGoals[index] = updateFn(listOfGoals[index]);

  VitalsStruct? emptyVital;
  void updateEmptyVitalStruct(Function(VitalsStruct) updateFn) {
    updateFn(emptyVital ??= VitalsStruct());
  }

  bool isGoalLoaded = false;

  List<TargetStruct> goals = [];
  void addToGoals(TargetStruct item) => goals.add(item);
  void removeFromGoals(TargetStruct item) => goals.remove(item);
  void removeAtIndexFromGoals(int index) => goals.removeAt(index);
  void insertAtIndexInGoals(int index, TargetStruct item) =>
      goals.insert(index, item);
  void updateGoalsAtIndex(int index, Function(TargetStruct) updateFn) =>
      goals[index] = updateFn(goals[index]);

  bool isVitalLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getGoals)] action in GoalComponent widget.
  ApiCallResponse? apiResult5vl;
  // Stores action output result for [Backend Call - API (vitals)] action in GoalComponent widget.
  ApiCallResponse? vitalsResp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
