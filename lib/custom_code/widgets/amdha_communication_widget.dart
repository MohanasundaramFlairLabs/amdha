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

import '/backend/schema/structs/index.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions

import '/backend/schema/structs/index.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions

import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';

class AmdhaCommunicationWidget extends StatefulWidget {
  const AmdhaCommunicationWidget({
    super.key,
    this.width,
    this.height,
    required this.serviceUrl,
    required this.onConnected,
    required this.onLoaded,
    required this.onParticipantAdded,
    required this.onParticipantDisconnected,
    required this.onDisconnected,
  });

  final double? width;
  final double? height;
  final String serviceUrl;
  final Future Function() onConnected;
  final Future Function() onLoaded;
  final Future Function(String data) onParticipantAdded;
  final Future Function(String data) onParticipantDisconnected;
  final Future Function() onDisconnected;

  @override
  State<AmdhaCommunicationWidget> createState() =>
      _AmdhaCommunicationWidgetState();
}

class _AmdhaCommunicationWidgetState extends State<AmdhaCommunicationWidget> {
  @override
  void initState() {
    super.initState();
  }

  void helper(CustomEvent message) {
    (() async {
      switch (message.eventType) {
        case "screenLoaded":
          await widget.onLoaded();
          break;
        case "callConnected":
          await widget.onConnected();
          break;
        case "callDisConnected":
          await widget.onDisconnected();
          break;
        case "participantJoined":
          await widget.onParticipantAdded(message.data.toString());
          break;
        case "participantLeft":
          await widget.onParticipantDisconnected(message.data.toString());
          break;
        default:
          break;
      }
    })();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (kIsWeb) {
        return SizedBox(
          height: widget.height,
          width: widget.width,
          child: AmdhaIFrameWidget(
              serviceUrl: widget.serviceUrl,
              callback: (message) => helper(message)),
        );
      } else if (Platform.isAndroid || Platform.isIOS) {
        return SizedBox(
          height: widget.height,
          width: widget.width,
          child: AmdhaWebViewWidget(
              serviceUrl: widget.serviceUrl,
              callback: (message) => helper(message)),
        );
      } else {
        return SizedBox(
          height: widget.height,
          width: widget.width,
          child: const Text("Unsupported system"),
        );
      }
    });
  }
}

class AmdhaWebViewWidget extends StatefulWidget {
  final String serviceUrl;
  final Function(CustomEvent message) callback;
  const AmdhaWebViewWidget(
      {super.key, required this.serviceUrl, required this.callback});

  @override
  State<StatefulWidget> createState() => _AmdhaWebViewWidget();
}

class _AmdhaWebViewWidget extends State<AmdhaWebViewWidget> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    requestPermission();

    _controller = WebViewController(
        onPermissionRequest: (WebViewPermissionRequest request) {
      request.grant();
    })
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("amdha_channel", onMessageReceived: (data) {
        var jsonData = jsonDecode(data.message);
        widget.callback(
            CustomEvent(eventType: jsonData['type'], data: jsonData['data']));
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.serviceUrl));
  }

  Future<void> requestPermission() async {
    await Permission.microphone.request();
    await Permission.camera.request();
    await Permission.audio.request();
    await Permission.bluetooth.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}

enum WebViewEventType {
  webviewLoaded("webViewLoaded");

  final String value;
  const WebViewEventType(this.value);
}

class AmdhaIFrameWidget extends StatefulWidget {
  final String serviceUrl;
  final Function(CustomEvent message) callback; //events fired by Iframe child

  const AmdhaIFrameWidget(
      {super.key, required this.serviceUrl, required this.callback});

  @override
  State<AmdhaIFrameWidget> createState() => _AmdhaIFrameWidget();
}

class _AmdhaIFrameWidget extends State<AmdhaIFrameWidget> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
    // _initializeIframe();

    html.window.onMessage.listen((event) {
      if (event.data != null) {
        var jsonData = jsonDecode(event.data);
        widget.callback(
            CustomEvent(eventType: jsonData['type'], data: jsonData['data']));
      }
    });
  }

  void _initializeIframe() {
    final iframe =
        html.document.getElementById("amdha_vc_iframe") as html.IFrameElement;
    iframe.src = widget.serviceUrl;
    print("Iframe src ---> ${iframe.src}");
  }

  Future<void> _requestPermissions() async {
    await html.window.navigator.getUserMedia(audio: true, video: true);
  }

  @override
  Widget build(BuildContext context) {
    print("widget.serviceUrl: ${widget.serviceUrl}");
    return Scaffold(
      body: HtmlElementView(
          creationParams: widget.serviceUrl,
          viewType: "amdha_vc_iframe" // Use the same view type as registered
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

enum IFrameEventType {
  iframeLoaded("iframeLoaded");

  final String value;
  const IFrameEventType(this.value);
}

enum AmdhaCommunicationEventType {
  onCallConnected("onCallConnected"),
  onCallDisconnected("onCallDisconnected"),
  onParticipantJoined("onParticipantJoined"),
  onParticipantDisconnected("onParticipantDisconnected");

  final String value;
  const AmdhaCommunicationEventType(this.value);
}

class CustomEvent {
  String eventType;
  dynamic data;

  CustomEvent({required this.eventType, this.data});
}
