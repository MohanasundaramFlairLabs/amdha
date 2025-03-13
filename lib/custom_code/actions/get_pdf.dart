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
import 'package:flutter/foundation.dart';

Future getPdf(
    BuildContext context,
    String baseUrl,
    HistoryModelStruct? data,
    ProfileModelStruct? patientDetails,
    String accessToken,
    String fileType,
    String taskId) async {
  // Add your function code here!
  final List<Map<String, dynamic>> medications = [];
  String payload = '';
  final dynamic header = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json'
  };
  print(header);
  print(baseUrl);
  if (fileType == "food" ||
      fileType == "exercise" ||
      fileType == "recommendation") {
    payload = jsonEncode({});
  } else {
    data?.caseSheet.medication.forEach((element) {
      medications.add({
        "name": element.name,
        "dosage": element.dosage,
        "units": element.units,
        "instruction": element.instruction,
        "period": element.period,
        "time": element.time
      });
    });
    final Map<String, dynamic> requestBody = {
      "notes": data?.notes,
      "medication": medications,
      "doctorDetails": {
        "doctorName":
            '${data?.doctorDetails.firstName} ${data?.doctorDetails.lastName}',
        "doctorRegNo": data?.doctorDetails.registrationNumber,
        "doctorId": data?.doctorDetails.userId,
        "doctorDegree": data?.doctorDetails.qualification,
        "doctorSignature": data?.doctorDetails.signatureUri
      },
      "patientDetails": {
        "patientName":
            '${patientDetails?.firstName} ${patientDetails?.lastName}',
        "patientAge":
            calculateAge(convertStringToDate(patientDetails!.dob)).toString(),
        "patientId": patientDetails!.internalId,
        "patientGender": patientDetails!.gender
      },
      "consultationDetails": {
        "consultationID": data?.caseSheet.caseSheetId,
        "consultationDate": DateFormat('d-M-y')
            .format(convertStringToDate(data!.caseSheet.consultedOn))
      },
      "contactDetails": {
        "contactMobile": data!.doctorDetails.phoneNumber,
        "contactMail": data!.doctorDetails.email,
        "contactWebsite": data!.doctorDetails.doctorCompanyMail,
        "contactAddress": data!.doctorDetails.location
      }
    };
    payload = jsonEncode(requestBody);
  }
  if (kIsWeb) {
    webPDFImplementation(baseUrl, payload, header, fileType);
  } else {
    mobilePdfImplementation(context, baseUrl, payload, header, fileType);
  }
}
