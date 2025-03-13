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

import 'package:flutter_svg/flutter_svg.dart';

class RecommendationBackgroundWidget extends StatefulWidget {
  const RecommendationBackgroundWidget(
      {super.key, this.width, this.height, this.recommendationType});

  final double? width;
  final double? height;
  final String? recommendationType;

  @override
  State<RecommendationBackgroundWidget> createState() =>
      _RecommendationBackgroundWidgetState();
}

class _RecommendationBackgroundWidgetState
    extends State<RecommendationBackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    String imagePath = '';

    switch ((widget.recommendationType ?? "").toLowerCase()) {
      case 'dietary habits':
      case 'not defined by diabetes!':
      case 'your health!':
        imagePath = 'assets/images/dietary_habits.svg';
        break;
      case 'exercise habits':
        imagePath = 'assets/images/exercise_habits.svg';
        break;
      case 'lifestyle habits':
      case 'smoking':
      case 'are smoke-free!':
        imagePath = 'assets/images/lifestyle_habits.svg';
        break;
      case 'medication adherence':
        imagePath = 'assets/images/medication_adherence.svg';
        break;
      case 'mental health':
        imagePath = 'assets/images/mental_health.svg';
        break;
      case 'sleep hygiene':
        imagePath = 'assets/images/sleep_hygiene.svg';
        break;
      case 'hdl cholesterol':
      case 'hdl cholesterol is low!':
      case 'hdl cholesterol is at an optimal level!':
        imagePath = 'assets/images/hdl_cholesterol.svg';
        break;
      case 'total cholesterol':
      case 'total cholesterol is high!':
      case 'total cholesterol levels are optimal!':
        imagePath = 'assets/images/total_cholesterol.svg';
        break;
      case 'systolic blood pressure':
      case 'systolic blood pressure is elevated/high!':
      case 'systolic blood pressure is optimal!':
        imagePath = 'assets/images/sbp.svg';
        break;
      case 'diastolic blood pressur':
        imagePath = 'assets/images/dbp.svg';
        break;
      case 'diabetes history':
        imagePath = 'assets/images/diabetes_history.svg';
        break;
      default:
        imagePath =
            'assets/images/dietary_habits.svg'; // Optionally handle a default case
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Adjust the radius as needed
      child: imagePath.isNotEmpty
          ? SvgPicture.asset(
              imagePath,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            )
          : Container(), // Optionally handle case when no image is found
    );
  }
}
