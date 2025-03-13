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

import 'package:flutter/services.dart';
import 'package:amdha/backend/api_requests/api_calls.dart';

Future<bool> getHealthDeviceVitals() async {
  // Add your function code here!

  const platform = MethodChannel('com.amdha.health');

  try {
    const vitalList =
        '["Weight", "Height", "HeartRate", "StepCount", "BloodPressure", "TotalBodyFat", "SpO2", "BloodGlucose", "Sleep", "BodyTemperature", "Vo2Max", "RespirationRate", "WaterIntake", "CaloriesBurned"]';

    final getLastSyncTime = await VitalsLastsyncDateCall.call(
        baseurl: FFAppState().baseUrl,
        userId: FFAppState().userId,
        data: vitalList);

    if (getLastSyncTime.statusCode == 200) {
      final lastSyncDates = getLastSyncTime.jsonBody['data'];
      print(lastSyncDates);
      final vitals = await platform.invokeMethod('getVitals', {
        'lastSyncedTime': lastSyncDates,
      });
      print("---------VITALS LIST------------");
      print('Vitals: $vitals');

      if (vitals.isNotEmpty) {
        var submitVital = await AddBGVitalCall.call(
          baseurl: FFAppState().baseUrl,
          userId: FFAppState().userId,
          dataJson: vitals,
        );
        print(FFAppState().userId);
        print("Get vitals list ${submitVital.statusCode}");
        print(submitVital);
        return true;
      }
      return false;
    } else {
      print("Error fetching last sync time: ${getLastSyncTime.statusCode}");
      return false;
    }
  } catch (e) {
    print("Failed to get vitals: ${e.toString()}");
    return false;
  }
}
