// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// // Automatic FlutterFlow imports
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/widgets/index.dart'; // Imports other custom widgets
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'index.dart'; // Imports other custom widgets

// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class CustomWebView extends StatefulWidget {
//   const CustomWebView({
//     super.key,
//     this.width,
//     this.height,
//     this.scanType,
//     this.userWeight,
//     this.userHeight,
//     this.dob,
//     this.posture,
//     this.gender,
//     required this.successCallback,
//     required this.errorCallback,
//   });

//   final double? width;
//   final double? height;
//   final String? scanType;
//   final double? userWeight;
//   final double? userHeight;
//   final String? dob;
//   final String? posture;
//   final String? gender;
//   final Future Function(List<VitalsStruct> scannedVitals) successCallback;
//   final Future Function() errorCallback;

//   @override
//   State<CustomWebView> createState() => _CustomWebViewState();
// }

// class _CustomWebViewState extends State<CustomWebView> {
//   dynamic getValueFromPath(Map<String, dynamic> object, List<String> path) {
//     dynamic current = object;

//     for (String key in path) {
//       if (current is Map<String, dynamic> && current.containsKey(key)) {
//         current = current[key];
//       } else {
//         return null; // or throw an error if the path is invalid
//       }
//     }

//     return current;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InAppWebView(
//       initialSettings: InAppWebViewSettings(
//           mediaPlaybackRequiresUserGesture: false,
//           allowsInlineMediaPlayback: true,
//           iframeAllow: "camera; microphone",
//           iframeAllowFullscreen: true),
//       initialUrlRequest: URLRequest(
//           url: WebUri(
//               "https://03a7-113-193-195-98.ngrok-free.app/activity/careplix?scantype=finger")),
//       onPermissionRequest: (controller, request) async {
//         return PermissionResponse(
//             resources: request.resources,
//             action: PermissionResponseAction.GRANT);
//       },
//       onWebViewCreated: (controller) {
//         //controller.evaluateJavascript(source: "window.getMessageFromFlutter('Sarang....')");
//         controller.addJavaScriptHandler(
//             handlerName: 'getMessage',
//             callback: (args) {
//               print("---------------------------------from js");
//               Map<String, dynamic> data = {
//                 "scanType": widget.scanType,
//                 "weight": widget.userWeight,
//                 "height": widget.userHeight,
//                 "dob": widget.dob,
//                 "posture": widget.posture,
//                 "gender": widget.gender
//               };
//               return jsonEncode(data);
//             });

//         controller.addJavaScriptHandler(
//             handlerName: 'goBackToCaptureScreen',
//             callback: (args) {
//               print("************************************************");
//               widget.errorCallback();
//               print(args);
//               //go back to prev screen
//             });

//         controller.addJavaScriptHandler(
//             handlerName: 'getScanResult',
//             callback: (args) {
//               //go back to prev screen
//               print(args);
//               saveVitals(args.first);
//             });
//       },
//     );
//   }

//   void saveVitals(dynamic data) {
//     final now = DateTime.now();
//     String formattedDate = DateFormat('yMd').format(now);
//     String formattedTime = DateFormat('jm').format(now);

//     Map<String, dynamic> vitalsMap = {
//       'HeartRate': ['vitals', 'heart_rate'],
//       'RespirationRate': ['vitals', 'resp_rate'],
//       'VO2Max': ['metadata', 'physiological_scores', 'vo2max'],
//       'StressIndex': ['metadata', 'heart_scores', 'stress_index'],
//       'TotalBodyFat': ['metadata', 'physiological_scores', 'bodyfat'],
//       'BloodVolume': ['metadata', 'physiological_scores', 'bloodvolume'],
//       'TotalBodyWater': ['metadat', 'physiological_scores', 'tbw'],
//       'BodyWater': ['metadat', 'physiological_scores', 'tbwp'],
//       'MeanArterialPressure': ['metadata', 'cardiovascular', 'map'],
//       'CardiacOutput': ['metadata', 'cardiovascular', 'cardiac_out'],
//       'SpO2': ['vitals', 'oxy_sat_prcnt']
//     };

//     List<VitalsStruct> vitalsList = [];
//     if (data != null && data is Map<String, dynamic>) {
//       //var vitals = data['vitals'];
//       vitalsMap.forEach((key, value) {
//         dynamic vital = getValueFromPath(data, value);
//         vitalsList.add(VitalsStruct(
//             type: key,
//             note: "",
//             value: "${vital}",
//             lastModified: formattedDate));
//       });
//       print("##########################");
//       print(vitalsList);
//       print(data);
//       print("##########################");
//       widget.successCallback(vitalsList);
//     } else {}
//   }
// }
