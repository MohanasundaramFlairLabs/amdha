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

class SymptomTrackerTimeline extends StatefulWidget {
  const SymptomTrackerTimeline({
    super.key,
    this.width,
    this.height,
    required this.symptomType,
    required this.color,
    required this.iconSize,
  });

  final double? width;
  final double? height;
  final String symptomType;
  final Color color;
  final int iconSize;

  @override
  State<SymptomTrackerTimeline> createState() => _SymptomTrackerTimelineState();
}

class _SymptomTrackerTimelineState extends State<SymptomTrackerTimeline> {
  final icons = {
    "Dizziness": FFIcons.kangry,
    "Tremors": FFIcons.kgroup,
    "Confusion": FFIcons.kconfused1,
    "Anxiety": FFIcons.kfrustration1,
    "Headache": FFIcons.kvector2,
    "Fainting": FFIcons.kgroup4,
    "Vomitting": FFIcons.kgroup2,
    "Fatigue": FFIcons.kvector3,
    "Headaches": FFIcons.kcardiacOutput,
    "Swelling": FFIcons.ksleep,
    "Convulsions": FFIcons.kepilepsy1,
    "Cough": FFIcons.kcough1,
    "Cold": FFIcons.ksolid,
    "Diarrhoea": FFIcons.ktoilet1,
    "Chest Pain/Chest tightness": FFIcons.kchestPain11,
    "Stomach ache": FFIcons.kabdominal1,
    "Blurred Vision": FFIcons.kblur1,
    "Feeling of vomitting/Nausea": FFIcons.kgroup2,
    "Shortening of breath/Not able to breathe properly": FFIcons.kbreathing1,
    "General Weakness": FFIcons.kperson1,
    "Loss of vision": FFIcons.kvisionProblem1,
    "Fatigue/Tiredness": FFIcons.kvector3,
    "Loss of concentration": FFIcons.kgroup3,
    "Excessive Sweating": FFIcons.kgroup1,
    "Racing/Pounding Heart": FFIcons.kvector1,
  };
  @override
  Widget build(BuildContext context) {
    final icon = icons[widget.symptomType] ?? FFIcons.kcardiacOutput;
    return Icon(
      icon,
      color: widget.color,
      size: widget.iconSize.toDouble(),
    );
  }
}
