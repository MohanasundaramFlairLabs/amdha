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

import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_update/in_app_update.dart';

Future checkForAppUpdate(BuildContext context) async {
  if (Platform.isAndroid) {
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().catchError((e) {
          SnackBar(content: Text(e.toString()));
          return AppUpdateResult.inAppUpdateFailed;
        });
      }
    }).catchError((e) {
      SnackBar(content: Text(e.toString()));
    });
  } else if (Platform.isIOS) {
    await getStoreVersion().then((cv) async {
      await PackageInfo.fromPlatform().then((lv) async {
        int localVersion = await getExtendedVersionNumber(lv.version);
        int cloudVersion = await getExtendedVersionNumber(cv ?? "0.0.0");
        if (cloudVersion <= localVersion) {
        } else {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
              title: Text('Updated Needed!'),
              message: Text(
                  'New version of AMDHA is now available. Kindly update to experience a new look.'),
              actions: [
                CupertinoActionSheetAction(
                  child: Text("UPDATE"),
                  onPressed: () async {
                    final url =
                        Uri.parse("https://apps.apple.com/app/id6651842371");
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                ),
              ],
            ),
          );
        }
      });
    });
  }
}
