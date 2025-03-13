import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'frequency_component_model.dart';
export 'frequency_component_model.dart';

class FrequencyComponentWidget extends StatefulWidget {
  const FrequencyComponentWidget({
    super.key,
    this.medicationFrequency,
    required this.reminderUnset,
    this.sosCallback,
    this.onTapAction,
  });

  final List<String>? medicationFrequency;
  final Future Function()? reminderUnset;
  final Future Function(bool state)? sosCallback;
  final Future Function()? onTapAction;

  @override
  State<FrequencyComponentWidget> createState() =>
      _FrequencyComponentWidgetState();
}

class _FrequencyComponentWidgetState extends State<FrequencyComponentWidget> {
  late FrequencyComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FrequencyComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FREQUENCY_COMPONENT_FrequencyComponent_O');
      _model.selectedFrequency = [];
      safeSetState(() {});
      if ((widget.medicationFrequency != null &&
              (widget.medicationFrequency)!.isNotEmpty) ==
          true) {
        _model.selectedFrequency =
            widget.medicationFrequency!.toList().cast<String>();
        safeSetState(() {});
      } else {
        _model.addToSelectedFrequency('Morning');
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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Frequency',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          Builder(
            builder: (context) {
              final frequency = FFAppState().frequencyList.toList();

              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(frequency.length, (frequencyIndex) {
                  final frequencyItem = frequency[frequencyIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'FREQUENCY_COMPONENT_Container_n9kldx7a_O');
                      await Future.wait([
                        Future(() async {
                          if (_model.selectedFrequency
                                  .contains(frequencyItem.often) ==
                              false) {
                            _model.addToSelectedFrequency(frequencyItem.often);
                            _model.updatePage(() {});
                            _model.selectedFrequency = functions
                                .sortFrequency(
                                    _model.selectedFrequency.toList())
                                .toList()
                                .cast<String>();
                            safeSetState(() {});
                            if (frequencyItem.often == 'SOS') {
                              await widget.sosCallback?.call(
                                true,
                              );
                              _model.selectedFrequency = [];
                              safeSetState(() {});
                              _model
                                  .addToSelectedFrequency(frequencyItem.often);
                              safeSetState(() {});
                              _model.selectedFrequency = functions
                                  .sortFrequency(
                                      _model.selectedFrequency.toList())
                                  .toList()
                                  .cast<String>();
                              safeSetState(() {});
                              await widget.reminderUnset?.call();
                            } else {
                              if (_model.selectedFrequency.firstOrNull ==
                                  'SOS') {
                                _model.selectedFrequency = [];
                                safeSetState(() {});
                                _model.addToSelectedFrequency(
                                    frequencyItem.often);
                                safeSetState(() {});
                                _model.selectedFrequency = functions
                                    .sortFrequency(
                                        _model.selectedFrequency.toList())
                                    .toList()
                                    .cast<String>();
                                safeSetState(() {});
                                await widget.sosCallback?.call(
                                  false,
                                );
                              }
                            }
                          } else {
                            if (_model.selectedFrequency.length > 1) {
                              await widget.sosCallback?.call(
                                false,
                              );
                              _model.removeFromSelectedFrequency(
                                  frequencyItem.often);
                              safeSetState(() {});
                              if ((_model.selectedFrequency.isNotEmpty) ==
                                  false) {
                                await widget.reminderUnset?.call();
                              }
                            }
                          }
                        }),
                      ]);
                      await widget.onTapAction?.call();
                    },
                    child: Container(
                      width: 62.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: _model.selectedFrequency
                                .contains(frequencyItem.often)
                            ? valueOrDefault<Color>(
                                FFAppState().theme.backgroudPrimaryColor,
                                Color(0x143894B5),
                              )
                            : FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: valueOrDefault<Color>(
                            _model.selectedFrequency
                                    .contains(frequencyItem.often)
                                ? valueOrDefault<Color>(
                                    FFAppState().theme.primaryColor,
                                    FlutterFlowTheme.of(context).primary,
                                  )
                                : Color(0x805D6A85),
                            Color(0x805D6A85),
                          ),
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (frequencyItem.often == 'Afternoon')
                            Icon(
                              FFIcons.kafterNoon,
                              color: _model.selectedFrequency
                                      .contains(frequencyItem.often)
                                  ? valueOrDefault<Color>(
                                      FFAppState().theme.primaryColor,
                                      FlutterFlowTheme.of(context).primary,
                                    )
                                  : Color(0xFF706F6F),
                              size: 16.0,
                            ),
                          if (frequencyItem.often == 'Morning')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: Icon(
                                FFIcons.kmOrning,
                                color: _model.selectedFrequency
                                        .contains(frequencyItem.often)
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0xFF706F6F),
                                size: 16.0,
                              ),
                            ),
                          if (frequencyItem.often == 'Night')
                            Icon(
                              FFIcons.knIght,
                              color: _model.selectedFrequency
                                      .contains(frequencyItem.often)
                                  ? valueOrDefault<Color>(
                                      FFAppState().theme.primaryColor,
                                      FlutterFlowTheme.of(context).primary,
                                    )
                                  : Color(0xFF706F6F),
                              size: 16.0,
                            ),
                          if (frequencyItem.often == 'SOS')
                            Icon(
                              FFIcons.ksos,
                              color: _model.selectedFrequency
                                      .contains(frequencyItem.often)
                                  ? valueOrDefault<Color>(
                                      FFAppState().theme.primaryColor,
                                      FlutterFlowTheme.of(context).primary,
                                    )
                                  : Color(0xFF706F6F),
                              size: 16.0,
                            ),
                          if (frequencyItem.often == 'Evening')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Icon(
                                FFIcons.kevening,
                                color: _model.selectedFrequency
                                        .contains(frequencyItem.often)
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0xFF706F6F),
                                size: 16.0,
                              ),
                            ),
                          Text(
                            frequencyItem.often,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: _model.selectedFrequency
                                          .contains(frequencyItem.often)
                                      ? valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        )
                                      : Color(0xFF706F6F),
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
