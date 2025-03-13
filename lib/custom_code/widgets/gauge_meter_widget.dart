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

import 'dart:math';

class GaugeMeterWidget extends StatefulWidget {
  const GaugeMeterWidget(
      {super.key,
      this.width,
      this.height,
      required this.value,
      required this.strokeWidth});

  final double? width;
  final double? height;
  final double value;
  final double strokeWidth;

  @override
  State<GaugeMeterWidget> createState() => _GaugeMeterWidgetState();
}

class _GaugeMeterWidgetState extends State<GaugeMeterWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.width ?? 120,
          widget.height ?? 60), // Define the semicircle size
      painter: GaugeMeterPainter(widget.value, widget.strokeWidth),
    );
  }
}

class GaugeMeterPainter extends CustomPainter {
  final double value;
  final double strokeWidth;
  GaugeMeterPainter(this.value, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height); // Bottom center
    final radius = size.width / 2;
    const gap = 1.0; // Pixel gap between segments

    final segmentPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt; // Rounded edges

    // Define start angle and individual segment angles
    const double startAngle = pi; // -180° (leftmost)
    const double segmentAngle = pi / 3; // 60° per segment

    // Define colors for each segment
    final List<Color> segmentColors = [
      Colors.green.withOpacity(0.5),
      Colors.amber.withOpacity(0.5),
      Colors.red.withOpacity(0.5),
    ];

    // Draw each segment with gaps
    for (int i = 0; i < segmentColors.length; i++) {
      segmentPaint.color = segmentColors[i];

      final double gapOffset = (gap / radius); // Convert pixel gap to radians
      final double adjustedStart =
          startAngle + (i * (segmentAngle + gapOffset));
      final double adjustedSweep = segmentAngle - gapOffset;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        adjustedStart,
        adjustedSweep,
        false,
        segmentPaint,
      );
    }

    // Draw the needle
    drawNeedle(canvas, center, radius * 0.7);
  }

  void drawNeedle(Canvas canvas, Offset center, double length) {
    final double angle =
        pi + (value / 100) * pi; // Map value (0-100) to -90° to +90°

    final needlePaint = Paint()..color = Colors.black;

    final needleBaseWidth = 5.0; // Width at the base of the needle
    final adjustedCenter =
        Offset(center.dx, center.dy - 5); // Raise pivot higher

    // Define needle points
    final Offset tip = Offset(
      adjustedCenter.dx + length * cos(angle),
      adjustedCenter.dy + length * sin(angle),
    );
    final Offset leftBase = Offset(
      adjustedCenter.dx + (needleBaseWidth / 2) * cos(angle + pi / 2),
      adjustedCenter.dy + (needleBaseWidth / 2) * sin(angle + pi / 2),
    );
    final Offset rightBase = Offset(
      adjustedCenter.dx + (needleBaseWidth / 2) * cos(angle - pi / 2),
      adjustedCenter.dy + (needleBaseWidth / 2) * sin(angle - pi / 2),
    );

    // 1️⃣ Draw gray background circle (behind the needle)
    canvas.drawCircle(
        adjustedCenter, 10, Paint()..color = Colors.grey.shade400);

    // 2️⃣ Draw needle (above the gray circle)
    final needlePath = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(leftBase.dx, leftBase.dy)
      ..lineTo(rightBase.dx, rightBase.dy)
      ..close();
    canvas.drawPath(needlePath, needlePaint);

    // 3️⃣ Draw black center circle (on top of needle)
    canvas.drawCircle(adjustedCenter, 7, Paint()..color = Colors.black);

    // 4️⃣ Draw transparent center hole
    canvas.drawCircle(adjustedCenter, 2, Paint()..color = Colors.grey.shade400);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
