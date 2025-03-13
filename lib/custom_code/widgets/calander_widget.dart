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

import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CalanderWidget extends StatefulWidget {
  const CalanderWidget(
      {super.key,
      this.width,
      this.height,
      this.min,
      this.max,
      required this.selectedDate,
      required this.enabledDates});

  final double? width;
  final double? height;
  final DateTime? min;
  final DateTime? max;
  final Future Function(DateTime date) selectedDate;
  final List<String> enabledDates;

  @override
  State<CalanderWidget> createState() => _CalanderWidgetState();
}

class _CalanderWidgetState extends State<CalanderWidget> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [];
  List<DateTime> selectableDates = [];
  late final configure = CalendarDatePicker2Config(
    selectedDayHighlightColor: Colors.blue,
    firstDate: widget.min != null ? widget.min! : DateTime.now(),
    lastDate: widget.max != null ? widget.max! : DateTime.now(),
    weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    firstDayOfWeek: 1,
    controlsHeight: 50,
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    dayTextStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    disabledDayTextStyle: const TextStyle(
      color: Colors.grey,
    ),
    selectableDayPredicate: (date) {
      return selectableDates.any(
        (element) =>
            element.year == date.year &&
            element.month == date.month &&
            element.day == date.day,
      );
    },
  );
  @override
  void initState() {
    super.initState();
    // Convert all UTC date strings into DateTime objects
    selectableDates = widget.enabledDates
        .map((dateString) => DateTime.parse(dateString)
            .toLocal()) // Convert to local time if needed
        .toList();

    _singleDatePickerValueWithDefaultValue = [
      widget.min ??
          DateTime
              .now() // Use widget.min if it's not null, else fallback to DateTime.now()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
        config: configure,
        value: _singleDatePickerValueWithDefaultValue,
        onValueChanged: (dates) {
          setState(() {
            _singleDatePickerValueWithDefaultValue = dates;
            widget.selectedDate(
                _singleDatePickerValueWithDefaultValue[0] ?? DateTime.now());
          });
        });
  }
}
