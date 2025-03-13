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

import 'package:flutter/foundation.dart';

Future<UrlsStruct> getEnv() async {
  if (isWeb) {
    var uri = Uri.base.origin;
    https: //patient.amdha.health
    var login = "$uri/login";
    var logout = "$uri/logout";
    if (uri == "https://patient.amdha.health") {
      return UrlsStruct(
          baseUrl: "https://app.amdha.health",
          loginUrl: login,
          logoutUrl: logout,
          razorpayKey: "rzp_live_k416zuaDiyviXx");
    } else if (uri == "https://patient-staging.amdha.health") {
      return UrlsStruct(
          baseUrl: "https://appdev.amdha.health",
          loginUrl: login,
          logoutUrl: logout,
          razorpayKey: "rzp_test_dQfXoJz1LHCay1");
    } else {
      return UrlsStruct(
          baseUrl: "https://develop.amdha.health",
          loginUrl: login,
          logoutUrl: logout,
          razorpayKey: "rzp_test_dQfXoJz1LHCay1");
    }
  } else {
    return UrlsStruct(
        baseUrl: "https://develop.amdha.health",
        loginUrl:
            "https://develop.amdha.health/v1/oauth/login?client_id=1e86472e-d3be-4c16-b760-44f0e599dfd5",
        logoutUrl:
            "https://auth.amdha.health/oauth2/logout?client_id=1e86472e-d3be-4c16-b760-44f0e599dfd5",
        razorpayKey: "rzp_test_dQfXoJz1LHCay1");

    return UrlsStruct(
        baseUrl: "https://appdev.amdha.health",
        loginUrl:
            "https://appdev.amdha.health/v1/oauth/login?client_id=ad5cfcb1-353c-491e-900c-43dca4877aae",
        logoutUrl:
            "https://auth.amdha.health/oauth2/logout?client_id=ad5cfcb1-353c-491e-900c-43dca4877aae",
        razorpayKey: "rzp_test_dQfXoJz1LHCay1");

    return UrlsStruct(
        baseUrl: "https://app.amdha.health",
        loginUrl:
            "https://app.amdha.health/v1/oauth/login?client_id=17c766d6-ff96-4888-b82b-03817bd5ea6b",
        logoutUrl:
            "https://auth.amdha.health/oauth2/logout?client_id=17c766d6-ff96-4888-b82b-03817bd5ea6b",
        razorpayKey: "rzp_live_k416zuaDiyviXx");
  }
}
