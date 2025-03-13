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

class CurvedBottomContainer extends StatefulWidget {
  final double width;
  final double height;
  final Color backgroundColor;

  // Default values for width and height
  const CurvedBottomContainer({
    Key? key,
    this.width = double.infinity, // Default to full width
    this.height = 300, // Default height
    this.backgroundColor = const Color(0xFFB84E83),
  }) : super(key: key);

  @override
  _CurvedBottomContainerState createState() => _CurvedBottomContainerState();
}

class _CurvedBottomContainerState extends State<CurvedBottomContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedBottomClipper(),
      child: Container(
        width: widget.width, // Use the width passed or default to infinity
        height: widget.height, // Use the height passed or default to 300
        color: widget.backgroundColor, // Set container color to #B84E83
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0); // Top left corner
    path.lineTo(size.width, 0); // Top right corner
    path.lineTo(size.width, size.height - 70); // Right before the curve
    path.quadraticBezierTo(
      size.width / 2, // Control point (center of the bottom curve)
      size.height + 70, // Control point (bottom of the curve)
      0, // Left end of the curve
      size.height - 70, // Left end before the curve
    );
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
