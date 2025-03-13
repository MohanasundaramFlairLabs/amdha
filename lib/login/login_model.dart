import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getEnv] action in Login widget.
  UrlsStruct? envlResponse;
  // Stores action output result for [Backend Call - API (getProfile)] action in LoginView widget.
  ApiCallResponse? profileResponse;
  // Stores action output result for [Backend Call - API (RefreshTokenApi)] action in LoginView widget.
  ApiCallResponse? refreshTokenResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
