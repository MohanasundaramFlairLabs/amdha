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

Future<List<int>> updateSelectedIndex(
  QuestionnaireStruct questionModel,
  int inputIndex,
) async {
  // Create a mutable copy of selectedIndex
  List<int> modifiableIndexList = List.from(questionModel.selectedIndex);

  modifiableIndexList.removeWhere((index) {
    String text = questionModel.options[inputIndex].text.trim();
    return text == "None of the above" || text == "None";
  });

  // Add the input index if it's not already in the list
  if (!modifiableIndexList.contains(inputIndex)) {
    modifiableIndexList.add(inputIndex);
  }

  // Assign the modified list back to the original list
  questionModel.selectedIndex = modifiableIndexList;

  return questionModel.selectedIndex;
}
