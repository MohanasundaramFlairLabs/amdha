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

import 'dart:async';

Future<String?> countDown(
  DateTime startDateTime,
  DateTime endDateTime,
) async {
  while (true) {
    final currentTime = DateTime.now();

    if (currentTime.isAfter(endDateTime)) {
      return "completed"; // Event has ended
    } else if (currentTime.isAfter(startDateTime)) {
      return "live"; // Event is ongoing
    }

    final difference = startDateTime.difference(currentTime);

    if (difference.isNegative) {
      return "Time has passed"; // Time has already passed
    } else if (difference.inDays >= 2) {
      await Future.delayed(Duration(seconds: 1)); // Delay 1 second
      continue; // Re-evaluate after delay
    } else if (difference.inDays >= 1) {
      return "1 day to go"; // 1 day remaining
    } else if (difference.inHours >= 2) {
      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;
      return minutes > 0
          ? "$hours hours $minutes minutes to go"
          : "$hours hours to go";
    } else if (difference.inHours >= 1) {
      final minutes = difference.inMinutes % 60;
      return minutes > 0 ? "1 hour $minutes minutes to go" : "1 hour to go";
    } else if (difference.inMinutes >= 2) {
      return "${difference.inMinutes} minutes to go";
    } else if (difference.inMinutes >= 1) {
      return "1 minute to go";
    } else {
      return "${difference.inSeconds} seconds to go"; // Less than a minute remaining
    }

    await Future.delayed(
        Duration(seconds: 1)); // Wait for 1 second before re-evaluating
  }
}
