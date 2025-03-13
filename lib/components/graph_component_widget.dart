import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/graph_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'graph_component_model.dart';
export 'graph_component_model.dart';

class GraphComponentWidget extends StatefulWidget {
  const GraphComponentWidget({
    super.key,
    this.title,
    this.type,
    this.units,
  });

  final String? title;
  final String? type;
  final List<String>? units;

  @override
  State<GraphComponentWidget> createState() => _GraphComponentWidgetState();
}

class _GraphComponentWidgetState extends State<GraphComponentWidget> {
  late GraphComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GRAPH_COMPONENT_GraphComponent_ON_INIT_S');
      _model.isLoaded = false;
      _model.date = getCurrentTimestamp;
      safeSetState(() {});
      safeSetState(() {
        _model.dropDownValueController?.reset();
      });
      _model.apiResult1p7 = await VitalGraphCall.call(
        type: widget.type,
        filter: _model.filter.toString(),
        baseurl: FFAppState().baseUrl,
        userId: FFAppState().userId,
      );

      if ((_model.apiResult1p7?.succeeded ?? true)) {
        _model.vital = VitalGraphStruct.maybeFromMap(getJsonField(
          (_model.apiResult1p7?.jsonBody ?? ''),
          r'''$.vital''',
        ));
        safeSetState(() {});
        _model.isLoaded = true;
        safeSetState(() {});
      } else {
        _model.isLoaded = true;
        safeSetState(() {});
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('error'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
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

    return Container(
      height: 350.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Color(0xDFDFDFF0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.title,
                            '--',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Builder(
                          builder: (context) {
                            final unit = (widget.type == 'BloodPressure'
                                        ? FFAppConstants.units
                                        : widget.units)
                                    ?.toList() ??
                                [];

                            return Wrap(
                              spacing: 5.0,
                              runSpacing: 5.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(unit.length, (unitIndex) {
                                final unitItem = unit[unitIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 8.0,
                                      height: 8.0,
                                      decoration: BoxDecoration(
                                        color: functions.getColors(unitIndex),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Text(
                                      unitItem,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 8.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 5.0)),
                                );
                              }),
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'GRAPH_COMPONENT_DateContainer_ON_TAP');
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: (_model.date ?? DateTime.now()),
                            firstDate: DateTime(1900),
                            lastDate: (getCurrentTimestamp ?? DateTime(2050)),
                            builder: (context, child) {
                              return wrapInMaterialDatePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                headerForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineLargeFamily,
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineLargeFamily),
                                    ),
                                pickerBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                pickerForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                actionButtonForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 24.0,
                              );
                            },
                          );

                          if (_datePickedDate != null) {
                            safeSetState(() {
                              _model.datePicked = DateTime(
                                _datePickedDate.year,
                                _datePickedDate.month,
                                _datePickedDate.day,
                              );
                            });
                          } else if (_model.datePicked != null) {
                            safeSetState(() {
                              _model.datePicked = _model.date;
                            });
                          }
                          if (_model.datePicked != null) {
                            _model.date = _model.datePicked;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: Color(0xFF949494),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  dateTimeFormat(
                                    "d MMM y",
                                    _model.date,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFF313131),
                                size: 12.0,
                              ),
                            ]
                                .addToStart(SizedBox(width: 10.0))
                                .addToEnd(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??=
                              FFAppConstants.graphFilterOptions.firstOrNull,
                        ),
                        options: FFAppConstants.graphFilterOptions,
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue = val);
                          logFirebaseEvent(
                              'GRAPH_COMPONENT_DropDown_4idsqel7_ON_FOR');
                          _model.filter = () {
                            if (_model.dropDownValue == 'Weekly') {
                              return 7;
                            } else if (_model.dropDownValue == 'Monthly') {
                              return 30;
                            } else if (_model.dropDownValue == 'Yearly') {
                              return 365;
                            } else if (_model.dropDownValue == '3 Month') {
                              return 90;
                            } else if (_model.dropDownValue == 'Daily') {
                              return 1;
                            } else {
                              return 180;
                            }
                          }();
                          safeSetState(() {});
                        },
                        width: 70.0,
                        height: 24.0,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 16.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).secondaryText,
                        borderWidth: 0.0,
                        borderRadius: 4.0,
                        margin:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ].divide(SizedBox(width: 5.0)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.graphModel,
                updateCallback: () => safeSetState(() {}),
                child: GraphWidget(
                  key: ValueKey(
                      '${_model.filter.toString()}${_model.date?.toString()}'),
                  type: widget.type,
                  filter: _model.filter,
                  title: widget.title,
                  unit: valueOrDefault<String>(
                    widget.units?.firstOrNull,
                    '- -',
                  ),
                  date: _model.date,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
