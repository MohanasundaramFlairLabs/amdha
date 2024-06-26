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

class StatusIcon extends StatefulWidget {
  const StatusIcon({
    super.key,
    this.width,
    this.height,
    required this.iconColor,
  });

  final double? width;
  final double? height;
  final Color iconColor;

  @override
  State<StatusIcon> createState() => _StatusIconState();
}

class _StatusIconState extends State<StatusIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ColorFiltered(
      colorFilter: ColorFilter.mode(
        widget.iconColor, // Desired color
        BlendMode.srcIn, // Blend mode to apply the color
      ),
      child: Image.asset(
        'assets/group124Copy.svg',
        width: 30.0,
        height: 30.0,
      ),
    ));
  }
}
