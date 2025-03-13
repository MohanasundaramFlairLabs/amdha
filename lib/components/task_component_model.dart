import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_vitals_component_widget.dart';
import '/components/connections_component_widget.dart';
import '/components/questionnaire_widget.dart';
import '/components/task_main_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/add_medication_component/add_medication_component_widget.dart';
import '/pages/components/higher_order_components/file_upload_component/file_upload_component_widget.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import 'task_component_widget.dart' show TaskComponentWidget;
import 'package:flutter/material.dart';

class TaskComponentModel extends FlutterFlowModel<TaskComponentWidget> {
  ///  Local state fields for this component.

  bool mainPage = false;

  bool questionPage = false;

  TasksStruct? task;
  void updateTaskStruct(Function(TasksStruct) updateFn) {
    updateFn(task ??= TasksStruct());
  }

  bool addmedicationPage = false;

  bool vitalPage = false;

  bool bookPage = false;

  SlotsStruct? slot;
  void updateSlotStruct(Function(SlotsStruct) updateFn) {
    updateFn(slot ??= SlotsStruct());
  }

  bool noTaskPage = false;

  bool fileUploadPage = false;

  bool isFromPushNotification = false;

  ///  State fields for stateful widgets in this component.

  // Model for TaskMainComponent component.
  late TaskMainComponentModel taskMainComponentModel;
  // Stores action output result for [Backend Call - API (Submittask)] action in TaskMainComponent widget.
  ApiCallResponse? apiResultvfo;
  // Stores action output result for [Backend Call - API (GetQuotas)] action in TaskMainComponent widget.
  ApiCallResponse? quotaResponsetask;
  // Stores action output result for [Backend Call - API (GetMediaUri)] action in TaskMainComponent widget.
  ApiCallResponse? urlResult;
  // Stores action output result for [Backend Call - API (Submittask)] action in TaskMainComponent widget.
  ApiCallResponse? apiResultopop;
  // Model for Questionnaire component.
  late QuestionnaireModel questionnaireModel;
  // Model for AddMedicationComponent component.
  late AddMedicationComponentModel addMedicationComponentModel;
  // Model for AddVitalsComponent component.
  late AddVitalsComponentModel addVitalsComponentModel;
  // Model for NoDataComponent component.
  late NoDataComponentModel noDataComponentModel;
  // Model for ConnectionsComponent component.
  late ConnectionsComponentModel connectionsComponentModel;
  // Model for FileUploadComponent component.
  late FileUploadComponentModel fileUploadComponentModel;

  @override
  void initState(BuildContext context) {
    taskMainComponentModel =
        createModel(context, () => TaskMainComponentModel());
    questionnaireModel = createModel(context, () => QuestionnaireModel());
    addMedicationComponentModel =
        createModel(context, () => AddMedicationComponentModel());
    addVitalsComponentModel =
        createModel(context, () => AddVitalsComponentModel());
    noDataComponentModel = createModel(context, () => NoDataComponentModel());
    connectionsComponentModel =
        createModel(context, () => ConnectionsComponentModel());
    fileUploadComponentModel =
        createModel(context, () => FileUploadComponentModel());
  }

  @override
  void dispose() {
    taskMainComponentModel.dispose();
    questionnaireModel.dispose();
    addMedicationComponentModel.dispose();
    addVitalsComponentModel.dispose();
    noDataComponentModel.dispose();
    connectionsComponentModel.dispose();
    fileUploadComponentModel.dispose();
  }
}
