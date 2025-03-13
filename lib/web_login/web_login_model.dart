import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'web_login_widget.dart' show WebLoginWidget;
import 'package:flutter/material.dart';

class WebLoginModel extends FlutterFlowModel<WebLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getProfile)] action in WebAppLogin widget.
  ApiCallResponse? getProfile;
  // Stores action output result for [Backend Call - API (RefreshTokenApi)] action in WebAppLogin widget.
  ApiCallResponse? refreshResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
