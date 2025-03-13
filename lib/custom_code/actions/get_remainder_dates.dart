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

Future<List<RemainderStruct>> getRemainderDates(
    List<MedicationModelStruct> medications) async {
  List<RemainderStruct> reminderList = [];

  for (var medication in medications) {
    if (medication.autoReminder) {
      DateTime start = DateTime.parse(medication.startDate).toLocal();
      DateTime end = DateTime.parse(medication.endDate).toLocal();

      List<String> reminderTimes = [];
      if (medication.reminderTimings.morning.isNotEmpty) {
        reminderTimes.add(medication.reminderTimings.morning!);
      }
      if (medication.reminderTimings.afternoon.isNotEmpty) {
        reminderTimes.add(medication.reminderTimings.afternoon!);
      }
      if (medication.reminderTimings.evening.isNotEmpty) {
        reminderTimes.add(medication.reminderTimings.evening!);
      }
      if (medication.reminderTimings.night.isNotEmpty) {
        reminderTimes.add(medication.reminderTimings.night!);
      }

      // Loop over each available reminder time
      for (var reminderTime in reminderTimes) {
        // Parse the reminder time (e.g., "3:15 PM" => 15:15)
        print('Processing reminder time: $reminderTime');
        var timeFormat = DateFormat.jm(); // Format "3:15 PM"
        DateTime parsedTime = timeFormat.parse(reminderTime);

        // Loop over each day from startDate to endDate
        DateTime currentDate = start;
        bool firstIteration = true;
        while (currentDate.isBefore(end) || currentDate.isAtSameMomentAs(end)) {
          // Set the hour and minute from reminderTime to currentDate (same date, different time)
          DateTime reminderDate = DateTime(
            currentDate.year,
            currentDate.month,
            currentDate.day,
            parsedTime.hour,
            parsedTime.minute,
          );

          // Only add the reminder if the date is in the future
          if (reminderDate.isAfter(DateTime.now())) {
            // Create a Reminder object and add it to the list
            reminderList.add(RemainderStruct(
              dateTime: reminderDate,
              name: medication.name,
              dosage: medication.dosage,
            ));
          } else {
            print('Skipping reminder for $reminderDate, it\'s in the past.');
          }
          switch (medication.howOften) {
            case "Daily":
              currentDate = currentDate.add(Duration(days: 1));
              break;
            case "Weekly":
              currentDate = currentDate.add(Duration(days: 7));
              break;
            case "Monthly":
              currentDate = DateTime(
                  currentDate.year, currentDate.month + 1, currentDate.day);
              if (currentDate.day != start.day) {
                currentDate = DateTime(currentDate.year, currentDate.month, 0);
              }
              break;
            case "Alternate":
              currentDate = currentDate.add(Duration(days: 2));
              break;
            default:
              currentDate = currentDate.add(Duration(days: 1));
          }
        }
      }
    }
  }
  return reminderList;
}
