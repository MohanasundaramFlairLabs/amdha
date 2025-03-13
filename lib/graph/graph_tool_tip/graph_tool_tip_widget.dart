import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'graph_tool_tip_model.dart';
export 'graph_tool_tip_model.dart';

class GraphToolTipWidget extends StatefulWidget {
  const GraphToolTipWidget({
    super.key,
    this.aggregate,
    this.filter,
    this.unit,
  });

  final AggregateStruct? aggregate;
  final int? filter;
  final String? unit;

  @override
  State<GraphToolTipWidget> createState() => _GraphToolTipWidgetState();
}

class _GraphToolTipWidgetState extends State<GraphToolTipWidget> {
  late GraphToolTipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphToolTipModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.filter == 1 ? 'Value ' : 'Median ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Color(0xFF5E04DD),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          TextSpan(
                            text: widget.filter == 1
                                ? valueOrDefault<String>(
                                    widget.aggregate?.value.toString(),
                                    '- -',
                                  )
                                : valueOrDefault<String>(
                                    widget.aggregate?.median.toString(),
                                    '- -',
                                  ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Color(0xFF5E04DD),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          TextSpan(
                            text: widget.unit!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Color(0xFF5E04DD),
                                  fontSize: 8.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    if (widget.filter != 1)
                      Text(
                        'Min ${valueOrDefault<String>(
                          widget.aggregate?.min.toString(),
                          '- -',
                        )}  Max ${valueOrDefault<String>(
                          widget.aggregate?.max.toString(),
                          '- -',
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                  ],
                ),
                Text(
                  () {
                    if ((widget.filter == 30) ||
                        (widget.filter == 90) ||
                        (widget.filter == 180)) {
                      return '${dateTimeFormat(
                        "d MMM y",
                        functions
                            .convertStringToDate(widget.aggregate!.weekStart),
                        locale: FFLocalizations.of(context).languageCode,
                      )} to ${dateTimeFormat(
                        "d MMM y",
                        functions
                            .convertStringToDate(widget.aggregate!.weekEnd),
                        locale: FFLocalizations.of(context).languageCode,
                      )}';
                    } else if (widget.filter == 7) {
                      return valueOrDefault<String>(
                        functions
                            .dateStringToDaysDateFormat(((String var1) {
                              return [var1];
                            }(widget.aggregate!.date))
                                .toList())
                            .firstOrNull,
                        '- -',
                      );
                    } else if (widget.filter == 1) {
                      return '${dateTimeFormat(
                        "d MMM y",
                        functions.convertStringToDate(widget.aggregate!.date),
                        locale: FFLocalizations.of(context).languageCode,
                      )} ${dateTimeFormat(
                        "jm",
                        functions.convertStringToDate(widget.aggregate!.date),
                        locale: FFLocalizations.of(context).languageCode,
                      )}';
                    } else {
                      return '${valueOrDefault<String>(
                        widget.aggregate?.month,
                        '- -',
                      )} ${valueOrDefault<String>(
                        widget.aggregate?.year.toString(),
                        '- -',
                      )}';
                    }
                  }(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 8.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: () {
                  if (widget.aggregate?.severity == 'Low') {
                    return Color(0xFFF6861F);
                  } else if (widget.aggregate?.severity == 'High') {
                    return Color(0xFFD83924);
                  } else {
                    return Color(0xFF5EBC44);
                  }
                }(),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                child: Text(
                  valueOrDefault<String>(
                                widget.aggregate?.severity,
                                '- -',
                              ) !=
                              ''
                      ? valueOrDefault<String>(
                          widget.aggregate?.severity,
                          'Normal',
                        )
                      : 'Normal',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondary,
                        fontSize: 9.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
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
