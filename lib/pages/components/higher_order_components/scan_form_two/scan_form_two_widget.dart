import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_form_two_model.dart';
export 'scan_form_two_model.dart';

class ScanFormTwoWidget extends StatefulWidget {
  const ScanFormTwoWidget({
    super.key,
    required this.callbackScanFormTwo,
    this.backCallbackFromTwo,
    bool? isFingerScan,
  }) : this.isFingerScan = isFingerScan ?? false;

  final Future Function(String? scanType)? callbackScanFormTwo;
  final Future Function()? backCallbackFromTwo;
  final bool isFingerScan;

  @override
  State<ScanFormTwoWidget> createState() => _ScanFormTwoWidgetState();
}

class _ScanFormTwoWidgetState extends State<ScanFormTwoWidget> {
  late ScanFormTwoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanFormTwoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCAN_FORM_TWO_ScanFormTwo_ON_INIT_STATE');
      _model.iSFaceScan = !widget.isFingerScan;
      _model.isFingerScan = widget.isFingerScan;
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
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
                    logFirebaseEvent('SCAN_FORM_TWO_Container_17jrybgy_ON_TAP');
                    await widget.backCallbackFromTwo?.call();
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
                  'Scan Vitals',
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
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SCAN_FORM_TWO_Container_81kvjgtl_ON_TAP');
                                  _model.iSFaceScan = true;
                                  _model.isFingerScan = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _model.iSFaceScan == true
                                        ? valueOrDefault<Color>(
                                            FFAppState()
                                                .theme
                                                .backgroudPrimaryColor,
                                            Color(0x143894B5),
                                          )
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: _model.iSFaceScan == true
                                          ? valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            )
                                          : Color(0xFFDFDFDF),
                                      width: _model.iSFaceScan ? 2.0 : 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 20.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.35,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kface,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                size: 100.0,
                                              ),
                                              Text(
                                                'Face Scan',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nevermind',
                                                      color: _model
                                                                  .iSFaceScan ==
                                                              true
                                                          ? valueOrDefault<
                                                              Color>(
                                                              FFAppState()
                                                                  .theme
                                                                  .primaryColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            )
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Nevermind'),
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            'Contactless scan using your smartphone\'s front camera',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nevermind',
                                                  color: _model.iSFaceScan ==
                                                          true
                                                      ? valueOrDefault<Color>(
                                                          FFAppState()
                                                              .theme
                                                              .primaryColor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        )
                                                      : Color(0x7F5D6A85),
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Nevermind'),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Or',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SCAN_FORM_TWO_Container_y2btmka5_ON_TAP');
                                  _model.isFingerScan = true;
                                  _model.iSFaceScan = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _model.isFingerScan == true
                                        ? valueOrDefault<Color>(
                                            FFAppState()
                                                .theme
                                                .backgroudPrimaryColor,
                                            Color(0x143894B5),
                                          )
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: _model.isFingerScan == true
                                          ? valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            )
                                          : Color(0xFFDFDFDF),
                                      width: _model.isFingerScan ? 2.0 : 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 20.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.35,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kthumbprint,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                size: 100.0,
                                              ),
                                              Text(
                                                'Finger Scan',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nevermind',
                                                      color: _model
                                                                  .isFingerScan ==
                                                              true
                                                          ? valueOrDefault<
                                                              Color>(
                                                              FFAppState()
                                                                  .theme
                                                                  .primaryColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            )
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Nevermind'),
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            'Place your finger on the rear camera of your smartphone to scan',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nevermind',
                                                  color: _model.isFingerScan ==
                                                          true
                                                      ? valueOrDefault<Color>(
                                                          FFAppState()
                                                              .theme
                                                              .primaryColor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        )
                                                      : Color(0x805D6A85),
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Nevermind'),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 20.0))
                              .addToStart(SizedBox(height: 20.0))
                              .addToEnd(SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isiOS)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                      child: Text(
                        'Disclaimer: \nAMDHA is not a substitute for the clinical judgment of a health care professional. Screening in AMDHA is intended to improve your awareness of general wellness.  Screening does not diagnose, treat, mitigate or prevent any disease, symptom, disorder or abnormal physical state. Consult with a health care professional or emergency services if you believe you may have a medical issue or before making any medical decisions.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                              lineHeight: 1.3,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('SCAN_FORM_TWO_COMP_NEXT_BTN_ON_TAP');
                await widget.callbackScanFormTwo?.call(
                  () {
                    if (_model.isFingerScan) {
                      return 'Finger Scan';
                    } else if (_model.iSFaceScan) {
                      return 'Face Scan';
                    } else {
                      return ' ';
                    }
                  }(),
                );
              },
              text: 'Next',
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
          ),
        ].addToEnd(SizedBox(height: 20.0)),
      ),
    );
  }
}
