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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

Future registerForLocalNotification(List<RemainderStruct> remainders) async {
  await FlutterLocalNotificationsPlugin().cancelAll();
  for (RemainderStruct reminder in remainders) {
    // Extract the DateTime, name (medication name), and dosage from the Reminder object
    DateTime? scheduleTime = reminder.dateTime;
    String title = reminder.name; // Title as medication name
    String message = "Dosage: ${reminder.dosage}"; // Body as dosage

    // Convert each schedule time to TZDateTime
    tz.TZDateTime scheduledDateTime =
        tz.TZDateTime.from(scheduleTime!, tz.local);

    // Schedule the notification for each reminder time
    await FlutterLocalNotificationsPlugin().zonedSchedule(
      // Use a unique messageId for each reminder or use any other identifier
      reminder.dateTime.hashCode, // Generate a unique ID for each notification
      "Time to take your Medicine",
      "Medication name: $title - $message",
      scheduledDateTime, // The time at which the notification should be shown
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          channelDescription: 'your_channel_description',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
