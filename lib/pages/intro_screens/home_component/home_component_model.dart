import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/interventions_widget.dart';
import '/components/p_p_subscribe_card_widget.dart';
import '/components/wellbeing_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/dashboard_component/remaining_scan_component/remaining_scan_component_widget.dart';
import '/pages/components/micro_components/dashboard_component/subscribe_component/subscribe_component_widget.dart';
import '/pages/components/micro_components/medication_components/upcoming_medication_component/upcoming_medication_component_widget.dart';
import '/pages/components/micro_components/vitals_component/goal_component/goal_component_widget.dart';
import '/pages/components/shimmer_components/dashboard_shimmer_component/dashboard_shimmer_component_widget.dart';
import '/pregnancy_program/stages_card/stages_card_widget.dart';
import '/senior_wellness/c_t_afor_food_exercise/c_t_afor_food_exercise_widget.dart';
import 'home_component_widget.dart' show HomeComponentWidget;
import 'package:flutter/material.dart';

class HomeComponentModel extends FlutterFlowModel<HomeComponentWidget> {
  ///  Local state fields for this component.

  WellbeingScoreStruct? wellbeing;
  void updateWellbeingStruct(Function(WellbeingScoreStruct) updateFn) {
    updateFn(wellbeing ??= WellbeingScoreStruct());
  }

  bool isHideScan = false;

  MedicationModelStruct? upcomingMedication;
  void updateUpcomingMedicationStruct(
      Function(MedicationModelStruct) updateFn) {
    updateFn(upcomingMedication ??= MedicationModelStruct());
  }

  QuotaModelStruct? quotas;
  void updateQuotasStruct(Function(QuotaModelStruct) updateFn) {
    updateFn(quotas ??= QuotaModelStruct());
  }

  bool isLoading = false;

  List<ConnectionsModelStruct> connectionsList = [];
  void addToConnectionsList(ConnectionsModelStruct item) =>
      connectionsList.add(item);
  void removeFromConnectionsList(ConnectionsModelStruct item) =>
      connectionsList.remove(item);
  void removeAtIndexFromConnectionsList(int index) =>
      connectionsList.removeAt(index);
  void insertAtIndexInConnectionsList(int index, ConnectionsModelStruct item) =>
      connectionsList.insert(index, item);
  void updateConnectionsListAtIndex(
          int index, Function(ConnectionsModelStruct) updateFn) =>
      connectionsList[index] = updateFn(connectionsList[index]);

  ProgramsStruct? pregnancyProgram;
  void updatePregnancyProgramStruct(Function(ProgramsStruct) updateFn) {
    updateFn(pregnancyProgram ??= ProgramsStruct());
  }

  QuotaModelStruct? freeScanDetails;
  void updateFreeScanDetailsStruct(Function(QuotaModelStruct) updateFn) {
    updateFn(freeScanDetails ??= QuotaModelStruct());
  }

  bool criticalTaskFound = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (wellbeingScore)] action in HomeComponent widget.
  ApiCallResponse? well;
  // Stores action output result for [Backend Call - API (GetQuotas)] action in HomeComponent widget.
  ApiCallResponse? quotaResponse;
  // Stores action output result for [Backend Call - API (checkFreeScan)] action in HomeComponent widget.
  ApiCallResponse? freescanResponse;
  // Stores action output result for [Backend Call - API (GetUpcomingConnections)] action in HomeComponent widget.
  ApiCallResponse? listofConnections;
  // Stores action output result for [Backend Call - API (Plans)] action in HomeComponent widget.
  ApiCallResponse? planresponse;
  // Stores action output result for [Backend Call - API (GetTask)] action in HomeComponent widget.
  ApiCallResponse? criticalTaskResult;
  // Model for PPSubscribeCard component.
  late PPSubscribeCardModel pPSubscribeCardModel;
  // Model for StagesCard component.
  late StagesCardModel stagesCardModel;
  // Model for WellbeingComponent component.
  late WellbeingComponentModel wellbeingComponentModel;
  // Model for CTAforFoodExercise component.
  late CTAforFoodExerciseModel cTAforFoodExerciseModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Interventions component.
  late InterventionsModel interventionsModel;
  // Model for GoalComponent component.
  late GoalComponentModel goalComponentModel;
  // Model for RemainingScanComponent component.
  late RemainingScanComponentModel remainingScanComponentModel;
  // Model for SubscribeComponent component.
  late SubscribeComponentModel subscribeComponentModel;
  // Model for UpcomingMedicationComponent component.
  late UpcomingMedicationComponentModel upcomingMedicationComponentModel;
  // Model for DashboardShimmerComponent component.
  late DashboardShimmerComponentModel dashboardShimmerComponentModel;

  @override
  void initState(BuildContext context) {
    pPSubscribeCardModel = createModel(context, () => PPSubscribeCardModel());
    stagesCardModel = createModel(context, () => StagesCardModel());
    wellbeingComponentModel =
        createModel(context, () => WellbeingComponentModel());
    cTAforFoodExerciseModel =
        createModel(context, () => CTAforFoodExerciseModel());
    interventionsModel = createModel(context, () => InterventionsModel());
    goalComponentModel = createModel(context, () => GoalComponentModel());
    remainingScanComponentModel =
        createModel(context, () => RemainingScanComponentModel());
    subscribeComponentModel =
        createModel(context, () => SubscribeComponentModel());
    upcomingMedicationComponentModel =
        createModel(context, () => UpcomingMedicationComponentModel());
    dashboardShimmerComponentModel =
        createModel(context, () => DashboardShimmerComponentModel());
  }

  @override
  void dispose() {
    pPSubscribeCardModel.dispose();
    stagesCardModel.dispose();
    wellbeingComponentModel.dispose();
    cTAforFoodExerciseModel.dispose();
    interventionsModel.dispose();
    goalComponentModel.dispose();
    remainingScanComponentModel.dispose();
    subscribeComponentModel.dispose();
    upcomingMedicationComponentModel.dispose();
    dashboardShimmerComponentModel.dispose();
  }
}
