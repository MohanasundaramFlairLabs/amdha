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

import 'dart:async';
import 'dart:convert'; // For jsonDecode
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart'
    if (dart.library.html) 'dart:ui' as ui;
import 'package:universal_html/html.dart' as html;

class WebAppLogin extends StatefulWidget {
  const WebAppLogin({
    super.key,
    this.width,
    this.height,
    required this.loginUrl,
    required this.successCallback,
    required this.failureCallback,
  });

  final double? width;
  final double? height;
  final String loginUrl;
  final Future Function() successCallback;
  final Future Function() failureCallback;

  @override
  State<WebAppLogin> createState() => _WebAppLoginState();
}

class _WebAppLoginState extends State<WebAppLogin> {
  late html.IFrameElement iframe;
  late StreamSubscription htmlEventListener;

  @override
  void initState() {
    super.initState();
    _initializeIframe(widget.loginUrl);
    _setupMessageListener();
  }

  void _initializeIframe(String url) {
    iframe = html.IFrameElement()
      ..src = url
      ..style.border = 'none';

    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => iframe,
    );
  }

  void _setupMessageListener() {
    htmlEventListener = html.window.onMessage.listen((event) {
      if (event.data != null) {
        print('Message from iframe: ${event.data}');
        final Map<String, dynamic> jsonData = jsonDecode(event.data);

        final String accessToken = jsonData['access_token'];
        final String refreshToken = jsonData['refresh_token'];

        print('Access Token: $accessToken');
        print('Refresh Token: $refreshToken');

        if (accessToken != null && refreshToken != null) {
          FFAppState().update(() {
            FFAppState().userId = accessToken;
            FFAppState().refreshToken = refreshToken;
            html.window.localStorage['userId'] = accessToken;
          });
          widget.successCallback();
          _disposeResources(); // Dispose resources after success callback
        } else {
          widget.failureCallback();
          _disposeResources(); // Dispose resources after failure callback
        }
      }
    });
  }

  void _updateIframeSrc(String newUrl) {
    setState(() {
      iframe.src = '';
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        iframe.src = newUrl;
      });
    });
  }

  @override
  void didUpdateWidget(WebAppLogin oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.loginUrl != widget.loginUrl) {
      _updateIframeSrc(widget.loginUrl);
    }
  }

  @override
  void dispose() {
    _disposeResources();
    super.dispose();
  }

  // Clean-up method: Remove the iframe and cancel the event listener
  void _disposeResources() {
    iframe.remove(); // Remove the iframe element from the DOM
    htmlEventListener.cancel(); // Cancel the message listener
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensure the UI adjusts for the keyboard
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: widget.height ?? MediaQuery.of(context).size.height,
                child: const HtmlElementView(
                  viewType: 'iframeElement',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
