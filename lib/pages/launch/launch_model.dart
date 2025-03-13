import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'launch_widget.dart' show LaunchWidget;
import 'package:flutter/material.dart';

class LaunchModel extends FlutterFlowModel<LaunchWidget> {
  ///  Local state fields for this page.

  bool hideLogo = false;

  bool showContent = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getEnv] action in launch widget.
  UrlsStruct? envres;
  // Stores action output result for [Backend Call - API (GetAuthToken)] action in launch widget.
  ApiCallResponse? authTokenResponse1;
  // Stores action output result for [Custom Action - getEnv] action in launch widget.
  UrlsStruct? envresponses;
  // Stores action output result for [Backend Call - API (getProfile)] action in launch widget.
  ApiCallResponse? profileResponse;
  // Stores action output result for [Backend Call - API (RefreshTokenApi)] action in launch widget.
  ApiCallResponse? apiResult1ow;
  // Stores action output result for [Custom Action - getEnv] action in launch widget.
  UrlsStruct? envResponse;
  // Stores action output result for [Custom Action - getEnv] action in launch widget.
  UrlsStruct? envresponse;
  // Stores action output result for [Custom Action - isRunningInMobileBrowser] action in launch widget.
  bool? isMobileBrowser;
  // Stores action output result for [Custom Action - getEnv] action in launch widget.
  UrlsStruct? envres2;
  // Stores action output result for [Custom Action - getFCMToken] action in launch widget.
  String? fcmToken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
