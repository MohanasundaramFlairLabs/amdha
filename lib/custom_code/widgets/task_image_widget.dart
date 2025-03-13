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

class TaskImageWidget extends StatefulWidget {
  const TaskImageWidget({
    super.key,
    this.width,
    this.height,
    required this.taskType,
  });

  final double? width;
  final double? height;
  final String taskType;

  @override
  State<TaskImageWidget> createState() => _TaskImageWidgetState();
}

class _TaskImageWidgetState extends State<TaskImageWidget> {
  @override
  Widget build(BuildContext context) {
    String imagePath = '';

    switch (widget.taskType) {
      case 'medication_management':
        imagePath = 'assets/images/Layer_1-2.png';
        break;
      case 'report_upload':
        imagePath = 'assets/images/Layer_1.png';
        break;
      case 'questionnaire':
        imagePath = 'assets/images/Capa_1.png';
        break;
      case 'measurement':
        imagePath = 'assets/images/Frame.png';
        break;
      case 'lab_test':
        imagePath = 'assets/images/blood-test_(2)_1.png';
        break;
      case 'symptom_tracker':
        imagePath = 'assets/images/meditation_1.png';
        break;
      case 'education':
        imagePath = 'assets/images/book_1.png';
        break;
      case 'appointment_booking':
        imagePath = 'assets/images/datingscan.png';
        break;
      case 'program_booking':
        imagePath = 'assets/images/program_image.png';
        break;
      case 'baby_kick':
        imagePath = 'assets/images/baby_kick.png';
        break;
      case 'logs':
        imagePath = 'assets/images/logs.png';
        break;
      case 'target':
      case 'goal_setting':
        imagePath = 'assets/images/target.png';
        break;
      case 'wellness_end':
        imagePath = 'assets/images/wellness_end.png';
        break;
      case 'food':
        imagePath = 'assets/images/food_cta.png';
        break;
      case 'exercise':
        imagePath = 'assets/images/exercise_cta.png';
        break;
      default:
        imagePath = ''; // Optionally handle a default case
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: imagePath.isNotEmpty
          ? Image.asset(
              imagePath,
              width: widget.width ?? 50.0,
              height: widget.height ?? 50.0,
              fit: BoxFit.contain,
            )
          : Container(), // Optionally handle case when no image is found
    );
  }
}
