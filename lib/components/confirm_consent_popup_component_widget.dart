import '';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_consent_popup_component_model.dart';
export 'confirm_consent_popup_component_model.dart';

class ConfirmConsentPopupComponentWidget extends StatefulWidget {
  const ConfirmConsentPopupComponentWidget({
    super.key,
    this.cancelCallback,
    this.acceptCallback,
    bool? consentStatus,
  }) : this.consentStatus = consentStatus ?? false;

  final Future Function()? cancelCallback;
  final Future Function(bool? isConcentAccepted)? acceptCallback;
  final bool consentStatus;

  @override
  State<ConfirmConsentPopupComponentWidget> createState() =>
      _ConfirmConsentPopupComponentWidgetState();
}

class _ConfirmConsentPopupComponentWidgetState
    extends State<ConfirmConsentPopupComponentWidget> {
  late ConfirmConsentPopupComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmConsentPopupComponentModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Text(
              'Confirmation',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Text(
              '1 credit will be deducted.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: Color(0xFFF6861F),
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Text(
              'Are you sure you want to book a consultation?',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          if (!widget.consentStatus)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Container(
                height: 70.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowCheckboxGroup(
                          options: [
                            'Share my medical records with this doctor'
                          ],
                          onChanged: (val) async {
                            safeSetState(
                                () => _model.checkboxGroupValues = val);
                            logFirebaseEvent(
                                'CONFIRM_CONSENT_POPUP_COMPONENT_Checkbox');
                            _model.isAccepted = !_model.isAccepted;
                            safeSetState(() {});
                          },
                          controller: _model.checkboxGroupValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          activeColor: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          checkColor: FlutterFlowTheme.of(context).info,
                          checkboxBorderColor: Color(0x00000000),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          checkboxBorderRadius: BorderRadius.circular(4.0),
                          initialized: _model.checkboxGroupValues != null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'CONFIRM_CONSENT_POPUP_COMPONENT_NO_BTN_O');
                    Navigator.pop(context);
                    await widget.cancelCallback?.call();
                  },
                  text: 'No',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
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
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'CONFIRM_CONSENT_POPUP_COMPONENT_YES_BTN_');
                    Navigator.pop(context);
                    await widget.acceptCallback?.call(
                      _model.isAccepted,
                    );
                  },
                  text: 'Yes',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: valueOrDefault<Color>(
                      FFAppState().theme.primaryColor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
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
              ],
            ),
          ),
        ]
            .divide(SizedBox(height: 10.0))
            .addToStart(SizedBox(height: 20.0))
            .addToEnd(SizedBox(height: 20.0)),
      ),
    );
  }
}
