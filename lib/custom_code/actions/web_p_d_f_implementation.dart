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

import 'index.dart'; // Imports other custom actions

import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;
import 'dart:typed_data';

Future webPDFImplementation(
    String url, String payload, dynamic headers, String fileType) async {
  // Add your function code here!
  try {
    // Perform the API call with headers and body
    final response = (fileType == "food" ||
            fileType == "exercise" ||
            fileType == "recommendation")
        ? await http.get(Uri.parse(url), headers: headers)
        : await http.post(Uri.parse(url), headers: headers, body: payload);

    if (response.statusCode == 200) {
      // Convert response to bytes
      Uint8List fileBytes = response.bodyBytes;

      // Create a Blob from the bytes
      final blob = html.Blob([fileBytes]);

      // Create a URL for the Blob
      final blobUrl = html.Url.createObjectUrlFromBlob(blob);

      String formattedDateTime =
          DateFormat('yyyyMMdd_kkmmss').format(DateTime.now()).toString();
      // Create an anchor element to trigger the download
      final fileName = fileType == "food"
          ? "food_history_"
          : (fileType == "exercise"
              ? "exercise_history_"
              : fileType == "recommendation"
                  ? "onboarding_recommendation_"
                  : "Amdha_Prescription_");
      final anchor = html.AnchorElement()
        ..href = blobUrl
        ..download = '$fileName$formattedDateTime.pdf'
        ..style.display = 'none';

      // Append to the DOM and trigger click
      html.document.body?.append(anchor);
      anchor.click();

      // Cleanup: Remove anchor and revoke Blob URL
      anchor.remove();
      html.Url.revokeObjectUrl(blobUrl);
    } else {
      print("Failed to download PDF: ${response.statusCode}");
    }
  } catch (e) {
    print("Error downloading PDF: $e");
  }
}
