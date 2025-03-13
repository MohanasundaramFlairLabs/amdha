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

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<String?> getFCMToken() async {
  String? fcmToken;
  if (kIsWeb) {
    // Request notification permission for the web
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      messaging
          .getToken(
              vapidKey:
                  "BLtEuf0uBRX5V3jdSeMdYipBsvrs2pfftbJozg8FwErnkl95RSs8utpw22VtHsX3ffD4PnVUyiTBI-pnClXtolQ")
          .then((token) async {
        debugPrint("got web token: $token");

        return token;
      });
    } else {
      print('User declined or has not accepted permission');
      return null;
    }
  } else {
    NotificationSettings settings =
        await FirebaseMessaging.instance.getNotificationSettings();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      fcmToken = await FirebaseMessaging.instance.getToken();
      print("FCM token: $fcmToken");
      return fcmToken;
    } else {
      print("Permission not granted for notifications");
      return null;
    }
  }
}
