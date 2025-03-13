import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'multivital_graph_tooltip_model.dart';
export 'multivital_graph_tooltip_model.dart';

class MultivitalGraphTooltipWidget extends StatefulWidget {
  const MultivitalGraphTooltipWidget({
    super.key,
    this.type,
    this.filter,
    this.unit,
    this.aggregateList,
  });

  final String? type;
  final int? filter;
  final String? unit;
  final List<AggregateStruct>? aggregateList;

  @override
  State<MultivitalGraphTooltipWidget> createState() =>
      _MultivitalGraphTooltipWidgetState();
}

class _MultivitalGraphTooltipWidgetState
    extends State<MultivitalGraphTooltipWidget> {
  late MultivitalGraphTooltipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultivitalGraphTooltipModel());

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
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.type,
                          '- -',
                        ),
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
                      Container(
                        decoration: BoxDecoration(
                          color: () {
                            if (widget.aggregateList?.firstOrNull?.severity ==
                                'Low') {
                              return Color(0xFFF6861F);
                            } else if (widget
                                    .aggregateList?.firstOrNull?.severity ==
                                'High') {
                              return Color(0xFFD83924);
                            } else {
                              return Color(0xFF5EBC44);
                            }
                          }(),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 6.0, 8.0, 6.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.aggregateList?.firstOrNull?.severity !=
                                          null &&
                                      widget.aggregateList?.firstOrNull
                                              ?.severity !=
                                          ''
                                  ? widget.aggregateList?.firstOrNull?.severity
                                  : 'Normal',
                              '- -',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 9.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                  text: widget.filter == 1
                                      ? 'Value '
                                      : 'Median ',
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
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.filter == 1
                                        ? valueOrDefault<String>(
                                            widget.aggregateList?.firstOrNull
                                                ?.value
                                                .toString(),
                                            '- -',
                                          )
                                        : valueOrDefault<String>(
                                            widget.aggregateList?.firstOrNull
                                                ?.median
                                                .toString(),
                                            '- -',
                                          ),
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
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.unit,
                                    '- -',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Color(0xFF5E04DD),
                                        fontSize: 8.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          if (widget.filter != 1)
                            Text(
                              'Min ${widget.aggregateList?.firstOrNull?.min.toString()}  Max ${widget.aggregateList?.firstOrNull?.max.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                        child: VerticalDivider(
                          width: 30.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.filter == 1
                                      ? 'Value '
                                      : 'Median ',
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
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.filter == 1
                                        ? valueOrDefault<String>(
                                            widget.aggregateList?.lastOrNull
                                                ?.value
                                                .toString(),
                                            '- -',
                                          )
                                        : valueOrDefault<String>(
                                            widget.aggregateList?.lastOrNull
                                                ?.median
                                                .toString(),
                                            '- -',
                                          ),
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
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.unit,
                                    '- -',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Color(0xFF5E04DD),
                                        fontSize: 8.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          if (widget.filter != 1)
                            Text(
                              'Min ${widget.aggregateList?.lastOrNull?.min.toString()}  Max ${widget.aggregateList?.lastOrNull?.max.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                        ],
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
                          functions.convertStringToDate(
                              widget.aggregateList!.firstOrNull!.weekStart),
                          locale: FFLocalizations.of(context).languageCode,
                        )} to ${dateTimeFormat(
                          "d MMM y",
                          functions.convertStringToDate(
                              widget.aggregateList!.firstOrNull!.weekEnd),
                          locale: FFLocalizations.of(context).languageCode,
                        )}';
                      } else if (widget.filter == 7) {
                        return valueOrDefault<String>(
                          functions
                              .dateStringToDaysDateFormat(((String var1) {
                                return [var1];
                              }(widget.aggregateList!.firstOrNull!.date))
                                  .toList())
                              .firstOrNull,
                          '- -',
                        );
                      } else if (widget.filter == 1) {
                        return '${dateTimeFormat(
                          "d MMM y",
                          functions.convertStringToDate(
                              widget.aggregateList!.firstOrNull!.date),
                          locale: FFLocalizations.of(context).languageCode,
                        )} ${dateTimeFormat(
                          "jm",
                          functions.convertStringToDate(
                              widget.aggregateList!.firstOrNull!.date),
                          locale: FFLocalizations.of(context).languageCode,
                        )}';
                      } else {
                        return '${widget.aggregateList?.firstOrNull?.month} ${widget.aggregateList?.firstOrNull?.year.toString()}';
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
            ),
          ],
        ),
      ),
    );
  }
}
