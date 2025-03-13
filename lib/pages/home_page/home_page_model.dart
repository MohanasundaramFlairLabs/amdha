import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/connections_component_widget.dart';
import '/components/task_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/education_component/education_component_widget.dart';
import '/pages/components/higher_order_components/medication_component/medication_component_widget.dart';
import '/pages/components/higher_order_components/vital_component/vital_component_widget.dart';
import '/pages/components/journal_component/journal_component_widget.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import '/pages/intro_screens/home_component/home_component_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int selectedIndex = 0;

  bool isHideNavBar = true;

  bool doScan = false;

  String subscriptionStatus = 'null';

  ProgramsStruct? program;
  void updateProgramStruct(Function(ProgramsStruct) updateFn) {
    updateFn(program ??= ProgramsStruct());
  }

  bool isFromPushnotification = false;

  int initalIndexTab = 0;

  bool isdataLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetUserSubscription)] action in HomePage widget.
  ApiCallResponse? subscriptionResponse;
  // Stores action output result for [Backend Call - API (SendFcmToken)] action in HomePage widget.
  ApiCallResponse? sendtoken;
  // Stores action output result for [Backend Call - API (GetProgram)] action in HomePage widget.
  ApiCallResponse? programResponse;
  // Stores action output result for [Backend Call - API (getProfile)] action in HomePage widget.
  ApiCallResponse? userprofile;
  // Stores action output result for [Backend Call - API (GetSettings)] action in HomePage widget.
  ApiCallResponse? apiResultp5k;
  // Stores action output result for [Backend Call - API (medication)] action in HomePage widget.
  ApiCallResponse? apiResultbzt;
  // Stores action output result for [Backend Call - API (GetQuotas)] action in HomePage widget.
  ApiCallResponse? quotaResponseHome;
  // Model for VitalComponent component.
  late VitalComponentModel vitalComponentModel;
  // Model for HomeComponent component.
  late HomeComponentModel homeComponentModel;
  // Model for MedicationComponent component.
  late MedicationComponentModel medicationComponentModel;
  // Model for EducationComponent component.
  late EducationComponentModel educationComponentModel;
  // Model for JournalComponent component.
  late JournalComponentModel journalComponentModel;
  // Model for ConnectionsComponent component.
  late ConnectionsComponentModel connectionsComponentModel;
  // Model for TaskComponent component.
  late TaskComponentModel taskComponentModel;
  // Model for CustomNavBar component.
  late CustomNavBarModel customNavBarModel;

  @override
  void initState(BuildContext context) {
    vitalComponentModel = createModel(context, () => VitalComponentModel());
    homeComponentModel = createModel(context, () => HomeComponentModel());
    medicationComponentModel =
        createModel(context, () => MedicationComponentModel());
    educationComponentModel =
        createModel(context, () => EducationComponentModel());
    journalComponentModel = createModel(context, () => JournalComponentModel());
    connectionsComponentModel =
        createModel(context, () => ConnectionsComponentModel());
    taskComponentModel = createModel(context, () => TaskComponentModel());
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    vitalComponentModel.dispose();
    homeComponentModel.dispose();
    medicationComponentModel.dispose();
    educationComponentModel.dispose();
    journalComponentModel.dispose();
    connectionsComponentModel.dispose();
    taskComponentModel.dispose();
    customNavBarModel.dispose();
  }
}
