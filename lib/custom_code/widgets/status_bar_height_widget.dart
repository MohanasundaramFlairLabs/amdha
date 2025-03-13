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

class StatusBarHeightWidget extends StatefulWidget {
  const StatusBarHeightWidget({
    super.key,
    this.width,
    this.height,
    required this.onHeightChanged,
  });

  final double? width;
  final double? height;
  final Future Function(double height) onHeightChanged;

  @override
  State<StatusBarHeightWidget> createState() => _StatusBarHeightWidgetState();
}

class _StatusBarHeightWidgetState extends State<StatusBarHeightWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final height = MediaQuery.of(context).padding.top;
      widget.onHeightChanged(height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
