import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subscription_screen_widget.dart' show SubscriptionScreenWidget;
import 'package:flutter/material.dart';

class SubscriptionScreenModel
    extends FlutterFlowModel<SubscriptionScreenWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  String? userName;

  String? mobile;

  bool isPlanReceived = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetAllPlans)] action in SubscriptionScreen widget.
  ApiCallResponse? allPlan;
  // Stores action output result for [Backend Call - API (Transaction)] action in PlanPurchaseCard widget.
  ApiCallResponse? apiResultrazor;
  // Stores action output result for [Backend Call - API (SubmitSubscription)] action in PlanPurchaseCard widget.
  ApiCallResponse? subscriptionResponse2;
  // Stores action output result for [Backend Call - API (GetQuotas)] action in PlanPurchaseCard widget.
  ApiCallResponse? quota;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
