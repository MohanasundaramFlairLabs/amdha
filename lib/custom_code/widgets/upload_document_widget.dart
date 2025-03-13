// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:device_info_plus/device_info_plus.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/foundation.dart';

import 'package:dotted_border/dotted_border.dart';

class UploadDocumentWidget extends StatefulWidget {
  const UploadDocumentWidget(
      {super.key,
      this.width,
      this.height,
      required this.isPermissionGranted,
      required this.setPermissionGranted,
      required this.successCallback,
      required this.borderColor,
      required this.isFromProfileUpdate,
      required this.iconColor});

  final double? width;
  final double? height;
  final bool isPermissionGranted;
  final Future Function() setPermissionGranted;
  final Future Function(FFUploadedFile selectedFiles, String fileName)
      successCallback;
  final Color borderColor;
  final bool isFromProfileUpdate;
  final Color iconColor;

  @override
  State<UploadDocumentWidget> createState() => _UploadDocumentWidgetState();
}

class _UploadDocumentWidgetState extends State<UploadDocumentWidget> {
  final picker = ImagePicker();

  Future showOptionsForMobileWeb() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text("Click to Upload"),
            onPressed: () async {
              Navigator.of(context).pop();
              openFilePicker();
            },
          ),
        ],
      ),
    );
  }

  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions:
          widget.isFromProfileUpdate ? ['jpg', 'jpeg', 'png'] : ['pdf'],
      allowMultiple: false,
    );

    if (result != null) {
      for (var value in result.files) {
        var size = value.size ~/ 1000000;
        if (size < 10) {
          if ((widget.isFromProfileUpdate ? ['jpg', 'jpeg', 'png'] : ['pdf'])
              .contains(value.extension)) {
            widget.successCallback(
              FFUploadedFile(bytes: value.bytes, name: value.name),
              value.name,
            );
          } else {
            showUnsupportedFileError();
          }
        } else {
          showFileSizeError();
        }
      }
    } else {
      showError();
    }
  }

  Future showOptionsForImage() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          if (widget.isFromProfileUpdate) ...[
            CupertinoActionSheetAction(
              child: Text('Photo Gallery'),
              onPressed: () async {
                Navigator.of(context).pop();
                await handleMediaSelection(ImageSource.gallery);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Camera'),
              onPressed: () async {
                Navigator.of(context).pop();
                await handleMediaSelection(ImageSource.camera);
              },
            ),
          ],
          CupertinoActionSheetAction(
            child: Text('Files'),
            onPressed: () async {
              Navigator.of(context).pop();
              if (widget.isFromProfileUpdate) {
                await handleMediaSelection(ImageSource.gallery);
              } else {
                openFilePicker();
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> handleMediaSelection(ImageSource source) async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      openCamera(source);
    } else {
      if (status.isDenied || status.isPermanentlyDenied) {
        requestPermission(context, "Camera", false);
      } else {
        await Permission.camera.request();
      }
    }
  }

  Future<void> openCamera(ImageSource sources) async {
    XFile? pickedFile = await picker.pickImage(
        source: sources, preferredCameraDevice: CameraDevice.rear);
    if (pickedFile != null) {
      var file = PlatformFile(
          name: pickedFile.name,
          size: await pickedFile.length(),
          path: pickedFile.path,
          bytes: await pickedFile.readAsBytes());
      setState(() {
        widget.successCallback(
            FFUploadedFile(bytes: file.bytes, name: file.name), file.name);
      });
    } else if (pickedFile != null) {
      showError();
    }
  }

  requestPermission(context, String name, bool fromIdUpload) {
    var text = widget.isFromProfileUpdate
        ? "Profile Picture"
        : "Medical report / Prescription";
    return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text("$name Permission"),
              content: Text(
                  "Please tap Settings below to grant access to your device's $name and proceed with uploading your $text securely"),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      openAppSettings();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Settings")),
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Close")),
              ],
            ));
  }

  void showFileSizeError() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
          "The file size exceeds the allowed limit. Please upload a file smaller than than 10 MB."),
    ));
  }

  void showUnsupportedFileError() {
    var text = widget.isFromProfileUpdate ? "jpg, jpeg, png" : "pdf";
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "This file format is not supported. Supported file formats are $text"),
    ));
  }

  void showError() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Maximum 10 files are allowed"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
          showOptionsForMobileWeb();
        } else if (kIsWeb) {
          openFilePicker();
        } else {
          if (widget.isPermissionGranted) {
            showOptionsForImage();
          } else {
            if (Platform.isAndroid) {
              final androidInfo = await DeviceInfoPlugin().androidInfo;
              await [
                Permission.camera,
                androidInfo.version.sdkInt <= 32
                    ? Permission.storage
                    : Permission.photos
              ].request();
            } else {
              await [Permission.camera, Permission.photos].request();
            }
            widget.setPermissionGranted();
            showOptionsForImage();
          }
        }
      },
      child: widget.isFromProfileUpdate
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // Background color of the circle
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(
                    8.0), // Adjust padding to control circle size
                child: Center(
                  // Ensures the icon is centered
                  child: Icon(
                    Icons.edit,
                    color: widget.iconColor ?? Colors.white,
                    size: 20,
                  ),
                ),
              ),
            )
          : DottedBorder(
              dashPattern: [8, 6],
              strokeWidth: 2,
              color: widget.borderColor,
              borderType: BorderType
                  .RRect, // BorderType can be RRect (rounded rectangle) or Circle
              radius: Radius.circular(10), // Adjust the radius for Circle type
              child: Container(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: widget.borderColor, // Use the iconColor parameter
                  ),
                ),
              ),
            ),
    );
  }
}
