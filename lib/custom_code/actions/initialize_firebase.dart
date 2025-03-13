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

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future initializeFirebase(BuildContext context) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize the local notifications plugin
  await _initializeLocalNotifications(flutterLocalNotificationsPlugin);

  // Request notification permissions (especially for iOS)
  await _requestPermissions(flutterLocalNotificationsPlugin);

  // Set up Firebase message handlers for background and foreground notifications
  await _setupFirebaseMessageHandlers(flutterLocalNotificationsPlugin, context);
}

// Request notification permissions (necessary on iOS)
Future<void> _requestPermissions(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  if (isiOS) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  } else if (isAndroid) {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    final bool? grantedNotificationPermission =
        await androidImplementation?.requestNotificationsPermission();
  }
}

// Initialize the local notification plugin
Future<void> _initializeLocalNotifications(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  if (isAndroid) {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Set up the notification channel for Android
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'test_channel',
      'Test Notifications',
      description: 'This channel is for test notifications',
      importance: Importance.max,
      playSound: true,
      showBadge: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}

// Set up Firebase message handlers for background and foreground notifications
Future<void> _setupFirebaseMessageHandlers(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    BuildContext context) async {
  // Background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Foreground message handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.data != null) {
      print('Foreground notification: ${message.data}');
      // _showLocalNotification(message, flutterLocalNotificationsPlugin);
    }
  });

  // Handle notification taps when the app is opened
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Notification opened the app: ${message.messageId}');
    if (message.data != null) {
      print('Notification data: ${message.data}');
      final index = 1; // Default index
      final doScan = false; // Default doScan

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.goNamed(
            'HomePage',
            queryParameters: {
              'index': serializeParam(index, ParamType.int),
              'doScan': serializeParam(doScan, ParamType.bool),
            }.withoutNulls,
          );
        }
      });
    }
  });
}

// Background message handler function
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
  // Handle background notification and show local notification
  if (message.data.isNotEmpty) {
    print('Background Notification Data: ${message.data}');
    _showLocalNotification(message, FlutterLocalNotificationsPlugin());
  }
}

// Function to show local notification when a message is received in the foreground or background
Future<void> _showLocalNotification(RemoteMessage message,
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  // Extract notification details from the message
  String title = "";
  String body = "";

  final taskData =
      message.data['amdha_notifcation']; // Assuming `task` is the key
  final taskMap = jsonDecode(taskData) as Map<String, dynamic>;
  if (taskMap != null) {
    title = taskMap['title'];
    body = taskMap['message'];
  } else {
    print('Failed to parse task struct.');
  }

  if (defaultTargetPlatform == TargetPlatform.android) {
    // Android notification settings
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title, // Notification title
      body, // Notification body
      platformChannelSpecifics,
      payload: 'data payload', // Optional data payload
    );
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    // iOS notification settings
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true, // Show an alert
      presentBadge: true, // Update the app’s badge
      presentSound: true, // Play a sound
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title, // Notification title
      body, // Notification body
      platformChannelSpecifics,
      payload: 'data payload', // Optional data payload
    );
  } else if (kIsWeb) {
    // Web push notifications are handled differently.
    // Web notifications are typically shown through the browser.
    print('Web Notification: $title');
    // You could add a custom logic for web notifications if needed
  } else {
    print('Unsupported platform for showing local notifications');
  }
}
