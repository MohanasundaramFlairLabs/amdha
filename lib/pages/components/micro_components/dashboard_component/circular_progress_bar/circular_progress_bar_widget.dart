import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'circular_progress_bar_model.dart';
export 'circular_progress_bar_model.dart';

class CircularProgressBarWidget extends StatefulWidget {
  const CircularProgressBarWidget({
    super.key,
    this.score,
    this.strength,
  });

  final int? score;
  final String? strength;

  @override
  State<CircularProgressBarWidget> createState() =>
      _CircularProgressBarWidgetState();
}

class _CircularProgressBarWidgetState extends State<CircularProgressBarWidget> {
  late CircularProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CircularProgressBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          width: 72.0,
          height: 72.0,
          decoration: BoxDecoration(
            color: Color(0x145D6A85),
            shape: BoxShape.circle,
          ),
          child: CircularPercentIndicator(
            percent: (widget.score!) / 100,
            radius: 32.0,
            lineWidth: 8.0,
            animation: true,
            animateFromLastPercent: true,
            progressColor: () {
              if (widget.score! >= 75) {
                return Color(0xFF3CB04D);
              } else if (widget.score! >= 50) {
                return valueOrDefault<Color>(
                  FFAppState().theme.primaryColor,
                  FlutterFlowTheme.of(context).primary,
                );
              } else if (widget.score! >= 25) {
                return Color(0xFFF7A730);
              } else if (widget.score! > 0) {
                return Color(0xFFB03C3C);
              } else {
                return FlutterFlowTheme.of(context).secondaryText;
              }
            }(),
            backgroundColor: () {
              if (widget.score! >= 75) {
                return Color(0x3D3CB04D);
              } else if (widget.score! >= 50) {
                return Color(0x3D3C6AB0);
              } else if (widget.score! >= 25) {
                return Color(0x3EF7A730);
              } else if (widget.score! > 0) {
                return Color(0x3DB03C3C);
              } else {
                return Color(0x3E5D6A85);
              }
            }(),
            startAngle: 360.0,
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.score != 0 ? '${widget.score?.toString()}%' : 'NA',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: () {
                        if (widget.score! >= 75) {
                          return Color(0xFF3CB04D);
                        } else if (widget.score! >= 50) {
                          return Color(0xFF3C6AB0);
                        } else if (widget.score! >= 25) {
                          return Color(0xFFF7A730);
                        } else if (widget.score! > 0) {
                          return Color(0xFFB03C3C);
                        } else {
                          return FlutterFlowTheme.of(context).secondaryText;
                        }
                      }(),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
