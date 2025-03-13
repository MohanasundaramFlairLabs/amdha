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

Future<bool> areAllQuestionsSelected(
    List<QuestionnaireStruct> questions) async {
  // Add your function code here!
  for (var question in questions) {
    if (question.selectedIndex.isEmpty) {
      return false; // Return false if any question is not selected
    }
  }
  return true;
}
