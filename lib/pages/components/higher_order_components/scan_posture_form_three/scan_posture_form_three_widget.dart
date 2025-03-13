import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/scan_instruction_component/scan_instruction_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_posture_form_three_model.dart';
export 'scan_posture_form_three_model.dart';

class ScanPostureFormThreeWidget extends StatefulWidget {
  const ScanPostureFormThreeWidget({
    super.key,
    required this.callbackScanFormThree,
    this.backCallbackFromThree,
    bool? isFingerScan,
  }) : this.isFingerScan = isFingerScan ?? false;

  final Future Function(String? posture)? callbackScanFormThree;
  final Future Function()? backCallbackFromThree;
  final bool isFingerScan;

  @override
  State<ScanPostureFormThreeWidget> createState() =>
      _ScanPostureFormThreeWidgetState();
}

class _ScanPostureFormThreeWidgetState
    extends State<ScanPostureFormThreeWidget> {
  late ScanPostureFormThreeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanPostureFormThreeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCAN_POSTURE_FORM_THREE_ScanPostureFormT');
      _model.selectedPosition = 'Resting';
      safeSetState(() {});
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height -
          FFAppState().statusBarHeight -
          FFAppState().navBarHeight,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 56.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'SCAN_POSTURE_FORM_THREE_Container_v0xum7');
                    await widget.backCallbackFromThree?.call();
                  },
                  child: Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
                Text(
                  'Scan Posture',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0.0,
            thickness: 0.25,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.35,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.selectedPosition == 'After Exercising')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/exercisePosition.png',
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            if (_model.selectedPosition == 'Standing')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/standingPosition.png',
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            if (_model.selectedPosition == 'After Walking')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/walkingPosition.png',
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            if (_model.selectedPosition == 'Resting')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/lyingPosition.png',
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  fit: BoxFit.contain,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _model.selectedPosition == 'Resting'
                                ? valueOrDefault<Color>(
                                    FFAppState().theme.backgroudPrimaryColor,
                                    Color(0x143894B5),
                                  )
                                : FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: _model.selectedPosition == 'Resting'
                                  ? valueOrDefault<Color>(
                                      FFAppState().theme.primaryColor,
                                      FlutterFlowTheme.of(context).primary,
                                    )
                                  : Color(0xFFDFDFDF),
                              width: 1.0,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SCAN_POSTURE_FORM_THREE_Row_rhua62kl_ON_');
                              _model.selectedPosition = 'Resting';
                              safeSetState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.ksitting,
                                  color: valueOrDefault<Color>(
                                    FFAppState().theme.primaryColor,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  size: 24.0,
                                ),
                                Text(
                                  'Resting',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nevermind',
                                        color: _model.selectedPosition ==
                                                'Resting'
                                            ? valueOrDefault<Color>(
                                                FFAppState().theme.primaryColor,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              )
                                            : Colors.black,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nevermind'),
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .addToStart(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _model.selectedPosition == 'Standing'
                                ? valueOrDefault<Color>(
                                    FFAppState().theme.backgroudPrimaryColor,
                                    Color(0x143894B5),
                                  )
                                : FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: _model.selectedPosition == 'Standing'
                                  ? valueOrDefault<Color>(
                                      FFAppState().theme.primaryColor,
                                      FlutterFlowTheme.of(context).primary,
                                    )
                                  : Color(0xFFDFDFDF),
                              width: 1.0,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SCAN_POSTURE_FORM_THREE_Row_gce76qrp_ON_');
                              _model.selectedPosition = 'Standing';
                              safeSetState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kstanding,
                                  color: valueOrDefault<Color>(
                                    FFAppState().theme.primaryColor,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  size: 24.0,
                                ),
                                Text(
                                  'Standing',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nevermind',
                                        color: _model.selectedPosition ==
                                                'Standing'
                                            ? valueOrDefault<Color>(
                                                FFAppState().theme.primaryColor,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              )
                                            : Colors.black,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nevermind'),
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .addToStart(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _model.selectedPosition == 'After Walking'
                                ? valueOrDefault<Color>(
                                    FFAppState().theme.backgroudPrimaryColor,
                                    Color(0x143894B5),
                                  )
                                : FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: _model.selectedPosition == 'After Walking'
                                  ? valueOrDefault<Color>(
                                      FFAppState().theme.primaryColor,
                                      FlutterFlowTheme.of(context).primary,
                                    )
                                  : Color(0xFFDFDFDF),
                              width: 1.0,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SCAN_POSTURE_FORM_THREE_Row_nza6r2wq_ON_');
                              _model.selectedPosition = 'After Walking';
                              safeSetState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kafterWalking,
                                  color: valueOrDefault<Color>(
                                    FFAppState().theme.primaryColor,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  size: 24.0,
                                ),
                                Text(
                                  'After Walking',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nevermind',
                                        color: _model.selectedPosition ==
                                                'After Walking'
                                            ? valueOrDefault<Color>(
                                                FFAppState().theme.primaryColor,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              )
                                            : Colors.black,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nevermind'),
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .addToStart(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _model.selectedPosition == 'After Exercising'
                                ? valueOrDefault<Color>(
                                    FFAppState().theme.backgroudPrimaryColor,
                                    Color(0x143894B5),
                                  )
                                : FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color:
                                  _model.selectedPosition == 'After Exercising'
                                      ? valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        )
                                      : Color(0xFFDFDFDF),
                              width: 1.0,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SCAN_POSTURE_FORM_THREE_Row_knht415q_ON_');
                              _model.selectedPosition = 'After Exercising';
                              safeSetState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kafterExercise,
                                  color: valueOrDefault<Color>(
                                    FFAppState().theme.primaryColor,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  size: 24.0,
                                ),
                                Text(
                                  'After Exercising',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nevermind',
                                        color: _model.selectedPosition ==
                                                'After Exercising'
                                            ? valueOrDefault<Color>(
                                                FFAppState().theme.primaryColor,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              )
                                            : Colors.black,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nevermind'),
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .addToStart(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 20.0))
                          .addToStart(SizedBox(height: 20.0))
                          .addToEnd(SizedBox(height: 20.0)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SCAN_POSTURE_FORM_THREE_SCAN_BTN_ON_TAP');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: Container(
                      height: 550.0,
                      child: ScanInstructionComponentWidget(
                        isFingerScan: widget.isFingerScan,
                        callbackAction: () async {
                          await widget.callbackScanFormThree?.call(
                            _model.selectedPosition,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            text: 'Scan',
            options: FFButtonOptions(
              width: MediaQuery.sizeOf(context).width * 0.95,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: valueOrDefault<Color>(
                FFAppState().theme.primaryColor,
                FlutterFlowTheme.of(context).primary,
              ),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ].addToEnd(SizedBox(height: 20.0)),
      ),
    );
  }
}
