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

import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future mobilePdfImplementation(BuildContext context, String url, String payload,
    dynamic headers, String fileType) async {
  print("payload-->");
  print(payload);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text("Downloading..."),
          ],
        ),
      );
    },
  );
  try {
    final dio = Dio();
    final response = (fileType == "food" ||
            fileType == "exercise" ||
            fileType == "recommendation")
        ? await dio.get(
            url,
            data: payload,
            options: Options(
              headers: headers,
              responseType: ResponseType.bytes,
            ),
          )
        : await dio.post(
            url,
            data: payload,
            options: Options(
              headers: headers,
              responseType: ResponseType.bytes,
            ),
          );

    final tempDir = await getTemporaryDirectory();
    final fileName = fileType == "food"
        ? "food_history_"
        : (fileType == "exercise"
            ? "exercise_history_"
            : fileType == "recommendation"
                ? "onboarding_recommendation_"
                : "Amdha_Prescription_");
    final filePath =
        '${tempDir.path}/$fileName${convertCurrentDateTimeToString()}.pdf';
    final file = File(filePath);
    await file.writeAsBytes(response.data);
    Navigator.of(context).pop();
    // Open the PDF
    await OpenFilex.open(filePath);
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("An error occurred while downloading the PDF."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
    debugPrint('Error fetching or opening PDF: $e');
  }
}

String convertCurrentDateTimeToString() {
  String formattedDateTime =
      DateFormat('yyyyMMdd_kkmmss').format(DateTime.now()).toString();
  return formattedDateTime;
}
