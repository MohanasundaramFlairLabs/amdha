// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomWebView extends StatefulWidget {
  const CustomWebView({
    super.key,
    this.width,
    this.height,
    this.scanType,
    this.userWeight,
    this.userHeight,
    this.dob,
    this.posture,
    this.gender,
    this.userId,
    this.freeScan,
    required this.successCallback,
    required this.errorCallback,
  });

  final double? width;
  final double? height;
  final String? scanType;
  final double? userWeight;
  final double? userHeight;
  final String? dob;
  final String? posture;
  final String? gender;
  final String? userId;
  final bool? freeScan;
  final Future Function() successCallback;
  final Future Function() errorCallback;

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  dynamic getValueFromPath(Map<String, dynamic> object, List<String> path) {
    dynamic current = object;

    for (String key in path) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return null; // or throw an error if the path is invalid
      }
    }

    return current;
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialSettings: InAppWebViewSettings(
          mediaPlaybackRequiresUserGesture: false,
          allowsInlineMediaPlayback: true,
          iframeAllow: "camera; microphone",
          iframeAllowFullscreen: true),
      initialUrlRequest: URLRequest(
          url: WebUri(
              "${FFAppState().baseUrl}/views/careplix.html?platform=mobile")),
      onPermissionRequest: (controller, request) async {
        return PermissionResponse(
            resources: request.resources,
            action: PermissionResponseAction.GRANT);
      },
      onWebViewCreated: (controller) {
        controller.addJavaScriptHandler(
            handlerName: 'getMessage',
            callback: (args) {
              Map<String, dynamic> data = {
                "scanType": widget.scanType,
                "weight": widget.userWeight,
                "height": widget.userHeight,
                "dob": widget.dob,
                "posture": widget.posture,
                "gender": widget.gender,
                "token": widget.userId,
                "freescan": widget.freeScan
              };
              return jsonEncode(data);
            });

        controller.addJavaScriptHandler(
            handlerName: 'goBackToCaptureScreen',
            callback: (args) {
              widget.errorCallback();
            });

        controller.addJavaScriptHandler(
            handlerName: 'getScanResult',
            callback: (args) {
              widget.successCallback();
            });
      },
    );
  }
}
