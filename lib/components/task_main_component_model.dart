import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import 'task_main_component_widget.dart' show TaskMainComponentWidget;
import 'package:flutter/material.dart';

class TaskMainComponentModel extends FlutterFlowModel<TaskMainComponentWidget> {
  ///  Local state fields for this component.

  List<TasksStruct> filteredTasks = [];
  void addToFilteredTasks(TasksStruct item) => filteredTasks.add(item);
  void removeFromFilteredTasks(TasksStruct item) => filteredTasks.remove(item);
  void removeAtIndexFromFilteredTasks(int index) =>
      filteredTasks.removeAt(index);
  void insertAtIndexInFilteredTasks(int index, TasksStruct item) =>
      filteredTasks.insert(index, item);
  void updateFilteredTasksAtIndex(int index, Function(TasksStruct) updateFn) =>
      filteredTasks[index] = updateFn(filteredTasks[index]);

  bool taskFound = false;

  bool isLoaded = false;

  String fetchMessage = 'Fetching Task...';

  bool criticalTaskFound = false;

  bool isIntervention = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetTask)] action in TaskMainComponent widget.
  ApiCallResponse? tasksResult;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for NoDataComponent component.
  late NoDataComponentModel noDataComponentModel;

  @override
  void initState(BuildContext context) {
    noDataComponentModel = createModel(context, () => NoDataComponentModel());
  }

  @override
  void dispose() {
    noDataComponentModel.dispose();
  }
}
