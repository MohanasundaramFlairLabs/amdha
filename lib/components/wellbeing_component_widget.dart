import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/dashboard_component/circular_progress_bar/circular_progress_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wellbeing_component_model.dart';
export 'wellbeing_component_model.dart';

class WellbeingComponentWidget extends StatefulWidget {
  const WellbeingComponentWidget({
    super.key,
    required this.lastUpdate,
    this.wellbeingScore,
  });

  final String? lastUpdate;
  final int? wellbeingScore;

  @override
  State<WellbeingComponentWidget> createState() =>
      _WellbeingComponentWidgetState();
}

class _WellbeingComponentWidgetState extends State<WellbeingComponentWidget> {
  late WellbeingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WellbeingComponentModel());

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Color(0x275D6A85),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      'Health Insights',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nevermind',
                            color: valueOrDefault<Color>(
                              FFAppState().theme.primaryColor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Nevermind'),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Text(
                      widget.lastUpdate != null && widget.lastUpdate != ''
                          ? 'Last updated'
                          : 'No scan data available',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  if (widget.lastUpdate != null && widget.lastUpdate != '')
                    Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        '${dateTimeFormat(
                          "d-M-y",
                          functions.convertStringToDate(widget.lastUpdate!),
                          locale: FFLocalizations.of(context).languageCode,
                        )} at ${dateTimeFormat(
                          "jm",
                          functions.convertStringToDate(widget.lastUpdate!),
                          locale: FFLocalizations.of(context).languageCode,
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 72.0,
                  height: 72.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: wrapWithModel(
                    model: _model.circularProgressBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CircularProgressBarWidget(
                      score: widget.wellbeingScore == 0
                          ? 0
                          : (int.parse(widget.wellbeingScore!.toString())),
                      strength: widget.wellbeingScore != 0 ? 'Excellent' : '_',
                    ),
                  ),
                ),
                Text(
                  () {
                    if (widget.wellbeingScore! >= 75) {
                      return 'Excellent';
                    } else if (widget.wellbeingScore! >= 50) {
                      return 'Good';
                    } else if (widget.wellbeingScore! >= 25) {
                      return 'Moderate';
                    } else if (widget.wellbeingScore! > 0) {
                      return 'Poor';
                    } else {
                      return '_';
                    }
                  }(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: () {
                          if (widget.wellbeingScore! >= 75) {
                            return Color(0xFF3CB04D);
                          } else if (widget.wellbeingScore! >= 50) {
                            return Color(0xFF3C6AB0);
                          } else if (widget.wellbeingScore! >= 25) {
                            return Color(0xFFF7A730);
                          } else if (widget.wellbeingScore! > 0) {
                            return Color(0xFFB03C3C);
                          } else {
                            return FlutterFlowTheme.of(context).secondaryText;
                          }
                        }(),
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ],
            ),
          ].addToStart(SizedBox(width: 15.0)).addToEnd(SizedBox(width: 15.0)),
        ),
      ),
    );
  }
}
