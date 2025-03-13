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

import 'package:webview_flutter/webview_flutter.dart';
import 'package:universal_html/html.dart' as html;

class LoginView extends StatefulWidget {
  const LoginView(
      {super.key,
      this.width,
      this.height,
      required this.baseurl,
      required this.loginUrl,
      required this.successCallback});

  final double? width;
  final double? height;
  final String baseurl;
  final String loginUrl;
  final Future Function() successCallback;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    clearCookies();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('AUTH_CHANNEL_DATA', onMessageReceived: (message) {
        print("Received message:${message.toString()}");
        final String data = message.message;
        print('Message received from JavaScript: $data');
        // Decode the JSON string
        final Map<String, dynamic> jsonData = jsonDecode(data);

        // Fetch the specific key
        final String accessToken = jsonData['access_token'];
        final String refreshToken = jsonData['refresh_token'];

        print('Access Token: $accessToken');
        print('Refresh Token: $refreshToken');

        FFAppState().update(() {
          FFAppState().userId = accessToken;
          FFAppState().refreshToken = refreshToken;
          html.window.localStorage['userId'] = accessToken;
        });
        widget.successCallback();
      })
      ..loadRequest(Uri.parse('${widget.loginUrl}'));
  }

  Future<void> clearCookies() async {
    final cookieManager = WebViewCookieManager();
    await cookieManager.clearCookies();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _webViewController);
  }
}
