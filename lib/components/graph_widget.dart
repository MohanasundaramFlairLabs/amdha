import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'graph_model.dart';
export 'graph_model.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({
    super.key,
    this.type,
    this.filter,
    this.title,
    this.unit,
    this.date,
  });

  final String? type;
  final int? filter;
  final String? title;
  final String? unit;
  final DateTime? date;

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  late GraphModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GRAPH_COMP_Graph_ON_INIT_STATE');
      _model.vital = null;
      safeSetState(() {});
      _model.isLoaded = false;
      safeSetState(() {});
      _model.apiResult1p7 = await VitalGraphCall.call(
        type: widget.type,
        filter: widget.filter?.toString(),
        baseurl: FFAppState().baseUrl,
        userId: FFAppState().userId,
        date: widget.date != null
            ? functions
                .nextMidnightEndDate(widget.date!)
                .millisecondsSinceEpoch
                .toString()
            : functions
                .nextMidnightEndDate(getCurrentTimestamp)
                .millisecondsSinceEpoch
                .toString(),
      );

      if ((_model.apiResult1p7?.succeeded ?? true)) {
        _model.isLoaded = true;
        _model.vital = VitalGraphStruct.maybeFromMap(getJsonField(
          (_model.apiResult1p7?.jsonBody ?? ''),
          r'''$.vital''',
        ));
        safeSetState(() {});
      }
    });

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

    return Builder(
      builder: (context) {
        if (_model.isLoaded) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_model.vital?.graph == 'line')
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        child: custom_widgets.LineChartView(
                          width: 100.0,
                          height: 100.0,
                          isShowingMainData: true,
                          minY: functions.getMinimumValue(
                              _model.vital?.aggregation.toList(),
                              widget.filter),
                          maxX: widget.filter == 1 ? 23.0 : 9.0,
                          maxY: functions.getMaximumValue(
                              _model.vital?.aggregation.toList(),
                              widget.filter!),
                          leftTitleReservedSize: 35.0,
                          bottomTitlesReservedSize: 40.0,
                          bottomTitleWidgetsFontSize: 8.0,
                          bottomAxisName: () {
                            if (widget.filter == 7) {
                              return 'Day';
                            } else if (widget.filter == 365) {
                              return 'Month';
                            } else if (widget.filter == 1) {
                              return 'Time';
                            } else {
                              return 'Date';
                            }
                          }(),
                          leftAxisName: widget.title,
                          bottomAxisNameFontSize: 8.0,
                          leftAxisNameFontSize: 8.0,
                          bottomAxisNameColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          leftAxisNameColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          bottomTitleWidgetsColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          leftAxisNameSize: 20.0,
                          barWidth: 3.0,
                          dataPointsList: functions.aggregationToLineData(
                              _model.vital!.aggregation.toList(),
                              widget.filter!),
                          bottomTitle: () {
                            if (widget.filter == 1) {
                              return functions.dateStringToTimeFormat(_model
                                  .vital!.aggregation.firstOrNull!.values
                                  .map((e) => e.date)
                                  .toList());
                            } else if (widget.filter == 7) {
                              return functions.dateStringToDaysDateFormat(_model
                                  .vital!.aggregation.firstOrNull!.value
                                  .map((e) => e.date)
                                  .toList());
                            } else if (widget.filter == 30) {
                              return functions.dateStringToDateFormat(
                                  _model.vital!.aggregation.firstOrNull!.value
                                      .map((e) => e.weekStart)
                                      .toList(),
                                  _model.vital!.aggregation.firstOrNull!.value
                                      .map((e) => e.weekEnd)
                                      .toList());
                            } else if (widget.filter == 90) {
                              return functions.dateStringToDateFormat(
                                  _model.vital!.aggregation.firstOrNull!.value
                                      .map((e) => e.weekStart)
                                      .toList(),
                                  _model.vital!.aggregation.firstOrNull!.value
                                      .map((e) => e.weekEnd)
                                      .toList());
                            } else if (widget.filter == 180) {
                              return functions.dateStringToDateFormat(
                                  _model.vital!.aggregation.firstOrNull!.value
                                      .map((e) => e.weekStart)
                                      .toList(),
                                  _model.vital!.aggregation.firstOrNull!.value
                                      .map((e) => e.weekEnd)
                                      .toList());
                            } else {
                              return functions.returnFirstThree(_model
                                  .vital!.aggregation.firstOrNull!.value
                                  .map((e) => e.month)
                                  .toList());
                            }
                          }(),
                          bottomaxisNameSizeReservedSize: 20.0,
                          xAxisInterval: () {
                            if (widget.filter == 7) {
                              return 0.0;
                            } else if (widget.filter == 30) {
                              return 0.0;
                            } else if (widget.filter == 90) {
                              return 3.0;
                            } else if (widget.filter == 180) {
                              return 5.0;
                            } else if (widget.filter == 1) {
                              return 1.0;
                            } else {
                              return 0.0;
                            }
                          }(),
                          filter: widget.filter,
                          unit: widget.unit,
                          minHorizontal:
                              functions.rangeToGet(widget.type).firstOrNull!,
                          maxHorizontal:
                              functions.rangeToGet(widget.type).lastOrNull!,
                          aggregation: _model.vital?.aggregation,
                          type: widget.type,
                        ),
                      ),
                    ),
                  ),
                ),
              if (_model.vital?.graph == 'bar')
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.0,
                      child: custom_widgets.BarChartView(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        xAxisLabelName: () {
                          if (widget.filter == 7) {
                            return 'Day';
                          } else if (widget.filter == 365) {
                            return 'Month';
                          } else if (widget.filter == 1) {
                            return 'Time';
                          } else {
                            return 'Date';
                          }
                        }(),
                        yAxisLabelName: widget.title,
                        xReservedSize: 40.0,
                        yReservedSize: 35.0,
                        xAxisFontSize: 8.0,
                        yAxisFontSize: 8.0,
                        horizontalLineColor: functions.getColors(1),
                        barColor: functions.getColors(0),
                        minHorizontal:
                            functions.rangeToGet(widget.type).firstOrNull!,
                        maxHorizontal:
                            functions.rangeToGet(widget.type).lastOrNull!,
                        barWidth: 20.0,
                        maxY: functions.getMaximumValue(
                            _model.vital?.aggregation.toList(),
                            widget.filter!),
                        xAxisLabelSize: 8.0,
                        yAxisLabelSize: 8.0,
                        xAxisPlot: () {
                          if (widget.filter == 1) {
                            return functions.dateStringToTimeFormat(_model
                                .vital!.aggregation.firstOrNull!.values
                                .map((e) => e.date)
                                .toList());
                          } else if (widget.filter == 7) {
                            return functions.dateStringToDaysDateFormat(_model
                                .vital!.aggregation.firstOrNull!.value
                                .map((e) => e.date)
                                .toList());
                          } else if (widget.filter == 30) {
                            return functions.dateStringToDateFormat(
                                _model.vital!.aggregation.firstOrNull!.value
                                    .map((e) => e.weekStart)
                                    .toList(),
                                _model.vital!.aggregation.firstOrNull!.value
                                    .map((e) => e.weekEnd)
                                    .toList());
                          } else if (widget.filter == 90) {
                            return functions.dateStringToDateFormat(
                                _model.vital!.aggregation.firstOrNull!.value
                                    .map((e) => e.weekStart)
                                    .toList(),
                                _model.vital!.aggregation.firstOrNull!.value
                                    .map((e) => e.weekEnd)
                                    .toList());
                          } else if (widget.filter == 180) {
                            return functions.dateStringToDateFormat(
                                _model.vital!.aggregation.firstOrNull!.value
                                    .map((e) => e.weekStart)
                                    .toList(),
                                _model.vital!.aggregation.firstOrNull!.value
                                    .map((e) => e.weekEnd)
                                    .toList());
                          } else {
                            return functions.returnFirstThree(_model
                                .vital!.aggregation.firstOrNull!.value
                                .map((e) => e.month)
                                .toList());
                          }
                        }(),
                        values: widget.filter == 1
                            ? _model.vital?.aggregation.firstOrNull?.values
                                .map((e) => e.value)
                                .toList()
                            : _model.vital?.aggregation.firstOrNull?.value
                                .map((e) => e.median)
                                .toList(),
                        unit: widget.unit,
                        filter: widget.filter,
                        xAxisInterval: () {
                          if (widget.filter == 7) {
                            return 0.0;
                          } else if (widget.filter == 30) {
                            return 0.0;
                          } else if (widget.filter == 90) {
                            return 3.0;
                          } else if (widget.filter == 180) {
                            return 5.0;
                          } else if (widget.filter == 1) {
                            return 1.0;
                          } else {
                            return 0.0;
                          }
                        }(),
                        aggregation: _model.vital?.aggregation,
                      ),
                    ),
                  ),
                ),
            ],
          );
        } else {
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 60.0,
                height: 60.0,
                child: custom_widgets.CircularProgress(
                  width: 60.0,
                  height: 60.0,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
