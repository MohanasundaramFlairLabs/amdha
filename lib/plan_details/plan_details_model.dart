import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'plan_details_widget.dart' show PlanDetailsWidget;
import 'package:flutter/material.dart';

class PlanDetailsModel extends FlutterFlowModel<PlanDetailsWidget> {
  ///  Local state fields for this page.

  AllPlansStruct? plans;
  void updatePlansStruct(Function(AllPlansStruct) updateFn) {
    updateFn(plans ??= AllPlansStruct());
  }

  String? userName;

  String? mobile;

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetAllPlans)] action in PlanDetails widget.
  ApiCallResponse? allPlans;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (Transaction)] action in PlanPurchaseCard widget.
  ApiCallResponse? apiResulty64;
  // Stores action output result for [Backend Call - API (SubmitSubscription)] action in PlanPurchaseCard widget.
  ApiCallResponse? apiResultin7;
  // Stores action output result for [Backend Call - API (GetQuotas)] action in PlanPurchaseCard widget.
  ApiCallResponse? quotas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
