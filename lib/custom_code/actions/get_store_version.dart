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

import 'package:upgrader/upgrader.dart';

Future<String?> getStoreVersion() async {
  String? storeVersion = null;
  ITunesSearchAPI iTunesSearchAPI = ITunesSearchAPI();
  Map<dynamic, dynamic>? result =
      await iTunesSearchAPI.lookupByBundleId("com.amdha.health", country: 'IN');
  if (result != null) storeVersion = iTunesSearchAPI.version(result);
  return storeVersion;
}
