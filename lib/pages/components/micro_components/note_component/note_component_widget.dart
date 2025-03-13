import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_component_model.dart';
export 'note_component_model.dart';

class NoteComponentWidget extends StatefulWidget {
  const NoteComponentWidget({super.key});

  @override
  State<NoteComponentWidget> createState() => _NoteComponentWidgetState();
}

class _NoteComponentWidgetState extends State<NoteComponentWidget> {
  late NoteComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x153894B5),
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FFIcons.kphSealCheckFill,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 16.0,
                ),
                Text(
                  'Before you start',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ].divide(SizedBox(width: 20.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.chevron_right,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 16.0,
                ),
                Text(
                  'Face scan needs proper light',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nevermind',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nevermind'),
                      ),
                ),
              ].divide(SizedBox(width: 20.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.chevron_right,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 16.0,
                ),
                Text(
                  'Please maintain proper face position',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nevermind',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nevermind'),
                      ),
                ),
              ].divide(SizedBox(width: 20.0)),
            ),
          ]
              .divide(SizedBox(height: 10.0))
              .addToStart(SizedBox(height: 20.0))
              .addToEnd(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
