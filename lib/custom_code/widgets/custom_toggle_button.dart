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

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({
    super.key,
    this.width,
    this.height,
    required this.isIntervention,
    required this.actioncallback,
  });

  final double? width;
  final double? height;
  final bool isIntervention;
  final Future Function() actioncallback;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.actioncallback();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.isIntervention ? Color(0xFFD83924) : Color(0xFFE9E9E9),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Toggle moving button with bell icon
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: widget.isIntervention
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Center(
                  child: Icon(
                    FFIcons.kurgent,
                    color: widget.isIntervention
                        ? Color(0xFFD83924)
                        : Color(0XFF949494),
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
