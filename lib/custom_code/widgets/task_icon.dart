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

class TaskIcon extends StatefulWidget {
  const TaskIcon({
    super.key,
    this.width,
    this.height,
    required this.taskType,
    required this.iconColor,
    required this.iconSize,
  });

  final double? width;
  final double? height;
  final String taskType;
  final Color iconColor;
  final double iconSize;

  @override
  State<TaskIcon> createState() => _TaskIconState();
}

class _TaskIconState extends State<TaskIcon> {
  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (widget.taskType) {
      case 'symptom_tracker':
        icon = FFIcons.ksymptomtracker;
        break;
      case 'measurement':
        icon = FFIcons.kmeasurement;
        break;
      case 'lab_test':
        icon = FFIcons.klabtest;
        break;
      case 'medication_management':
        icon = FFIcons.kmedicationremainder;
        break;
      case 'questionnaire':
        icon = FFIcons.kquestionaire;
        break;
      case 'education':
        icon = FFIcons.keducation;
        break;
      case 'appointment_booking':
        icon = FFIcons.kappiontment;
        break;
      case 'programassigned':
        icon = FFIcons.kprogramassigned;
        break;
      case 'baby_kick':
        icon = FFIcons.kbabykick;
        break;
      case 'logs':
        icon = FFIcons.kappiontment;
        break;
      case 'goal_setting':
      case 'target':
        icon = FFIcons.kgoalstarget;
        break;
      case 'programend':
        icon = FFIcons.kprogramend;
        break;
      case 'food':
      case 'exercise':
        icon = FFIcons.kfoodexercise;
        break;
      case 'report_upload':
        icon = FFIcons.kreportupload;
        break;
      case 'mood_tracker':
        icon = FFIcons.kmoodtracker;
        break;
      case 'affirmations':
        icon = FFIcons.kaffirmations;
        break;
      default:
        icon = FFIcons.kquestionaire;
        break;
    }

    return Icon(
      icon,
      color: widget.iconColor,
      size: widget.iconSize,
    );
  }
}
