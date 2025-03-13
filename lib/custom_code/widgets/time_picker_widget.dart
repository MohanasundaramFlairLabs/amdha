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

import 'package:time_picker_spinner/time_picker_spinner.dart';

import 'index.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({
    super.key,
    this.width,
    this.height,
    required this.onTimeSelected,
    required this.initialTime,
  });

  final double? width;
  final double? height;
  final Future Function(String dateTime) onTimeSelected;
  final DateTime initialTime;

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0);
    //dateTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height ?? MediaQuery.of(context).size.height / 3.5,
        width: widget.width ?? MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            TimePickerSpinner(
              locale: const Locale('en', ''),
              time: dateTime,
              is24HourMode: true,
              isShowSeconds: false,
              itemHeight: 50, // Adjust for proper spacing
              minutesInterval: 5,
              spacing: 10,
              normalTextStyle: const TextStyle(
                fontSize: 20,
                color: Colors.grey, // Non-selected items will be grey
              ),
              highlightedTextStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Selected hour and minute will be teal
              ),
              isForce2Digits: true,
              onTimeChange: (time) {
                setState(() {
                  dateTime = time;
                });
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: const [
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 30.0),
            //       child: Text(
            //         "hours",
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: Colors.teal,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 30.0),
            //       child: Text(
            //         "mins",
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: Colors.teal,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Match the image color
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    int totalMinutes = dateTime.hour * 60 + dateTime.minute;
                    String formattedTime = totalMinutes.toString();
                    //String formattedTime = DateFormat('mm').format(dateTime); // Format as HH:mm
                    await widget.onTimeSelected(formattedTime);
                    Navigator.pop(context, formattedTime);
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey, // Darker color for OK
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
