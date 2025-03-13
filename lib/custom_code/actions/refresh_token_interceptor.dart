// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import '/backend/api_requests/api_interceptor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:universal_html/html.dart' as html;

class RefreshTokenInterceptor extends FFApiInterceptor {
  late GoRouter router;
  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Perform any necessary calls or modifications to the [options] before
    // the API call is made.
    options.headers['Authorization'] = 'Bearer ${FFAppState().userId}';
    return options;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    if (response.statusCode == 401) {
      // Call the refresh token API
      final refreshResponse = await http.get(
          Uri.parse('${FFAppState().baseUrl}/v1/refresh'),
          headers: {'refresh-token': FFAppState().refreshToken});

      final Map<String, dynamic> responseJson =
          jsonDecode(refreshResponse.body);

      if (responseJson['statusCode'] == 200) {
        // Extract the new auth token from the response
        final newToken = responseJson['accessToken'];

        // Update the auth token in your app stater
        FFAppState().update(() {
          FFAppState().userId = newToken;
          if (isWeb) {
            html.window.localStorage['userId'] = newToken;
          }
        });

        // Retry the original API call with the new auth token
        return retryFn();
      } else {
        // Handle refresh token failure
        FFAppState().refreshToken = '';
        FFAppState().userId = '';
        return response;
      }
    } else {
      // Return the original response if not 401
      return response;
    }
  }
}
