import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_screen_widget.dart' show SubscriptionScreenWidget;
import 'package:flutter/material.dart';

class SubscriptionScreenModel
    extends FlutterFlowModel<SubscriptionScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
