import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escalation_popup_model.dart';
export 'escalation_popup_model.dart';

class EscalationPopupWidget extends StatefulWidget {
  const EscalationPopupWidget({
    super.key,
    this.title,
    this.message,
  });

  final String? title;
  final String? message;

  @override
  State<EscalationPopupWidget> createState() => _EscalationPopupWidgetState();
}

class _EscalationPopupWidgetState extends State<EscalationPopupWidget> {
  late EscalationPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscalationPopupModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  FFAppState().theme.backgroudPrimaryColor,
                  Color(0x253894B5),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22.0),
                  bottomRight: Radius.circular(22.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      height: 145.0,
                      child: custom_widgets.TaskImageWidget(
                        width: 120.0,
                        height: 145.0,
                        taskType: 'baby_kick',
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.title,
                          '-',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nevermind',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Nevermind'),
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.message,
                          '-',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
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
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('ESCALATION_POPUP_COMP_OK_BTN_ON_TAP');
                Navigator.pop(context);
              },
              text: 'Ok',
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.7,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: valueOrDefault<Color>(
                  FFAppState().theme.primaryColor,
                  FlutterFlowTheme.of(context).primary,
                ),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Nevermind',
                      color: valueOrDefault<Color>(
                        FFAppState().theme.secondaryColor,
                        FlutterFlowTheme.of(context).secondary,
                      ),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Nevermind'),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: valueOrDefault<Color>(
                    FFAppState().theme.primaryColor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ].divide(SizedBox(height: 20.0)).addToEnd(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
