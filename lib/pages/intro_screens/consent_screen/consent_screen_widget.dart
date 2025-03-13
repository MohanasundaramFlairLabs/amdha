import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/consent/consent_box/consent_box_widget.dart';
import '/pages/components/consent/note_box/note_box_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'consent_screen_model.dart';
export 'consent_screen_model.dart';

class ConsentScreenWidget extends StatefulWidget {
  const ConsentScreenWidget({
    super.key,
    bool? isFromMenu,
  }) : this.isFromMenu = isFromMenu ?? false;

  final bool isFromMenu;

  static String routeName = 'ConsentScreen';
  static String routePath = '/consentScreen';

  @override
  State<ConsentScreenWidget> createState() => _ConsentScreenWidgetState();
}

class _ConsentScreenWidgetState extends State<ConsentScreenWidget> {
  late ConsentScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsentScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONSENT_SCREEN_ConsentScreen_ON_INIT_STA');
      _model.isCheckbox1Checked = false;
      _model.isCheckbox2Checked = false;
      _model.isCheckbox3Checked = false;
      safeSetState(() {});
      _model.apiResult3z3 = await GetAmdhaConsentCall.call(
        baseurl: FFAppState().baseUrl,
        userId: FFAppState().userId,
      );

      if ((_model.apiResult3z3?.succeeded ?? true)) {
        _model.consent = ConsentModelStruct.maybeFromMap(
            (_model.apiResult3z3?.jsonBody ?? ''));
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                      if (widget.isFromMenu)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONSENT_SCREEN_Container_38w2rgjl_ON_TAP');
                            context.safePop();
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      Text(
                        'Terms & conditions',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
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
                wrapWithModel(
                  model: _model.noteBoxModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NoteBoxWidget(
                    title: 'Note !',
                    subTitle:
                        'Please review and accept all three policies to proceed. By clicking \'Agree and continue\', you confirm your acceptance of the Terms of Use, Cancellation and Refund Policy, and Privacy Policy.',
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      wrapWithModel(
                        model: _model.consentBoxModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: ConsentBoxWidget(
                          title: _model.consent?.fileUrl.firstOrNull?.title,
                          subTitle: 'AMDHA',
                          consentInfo: '',
                          showCheckBox: !widget.isFromMenu,
                          pdfPath: _model.consent?.fileUrl.firstOrNull?.path,
                          actionCallback: () async {
                            logFirebaseEvent(
                                'CONSENT_SCREEN_Container_gs5l3gwq_CALLBA');
                            _model.isCheckbox1Checked =
                                !_model.isCheckbox1Checked;
                            safeSetState(() {});
                          },
                        ),
                      ),
                      Divider(
                        height: 0.0,
                        thickness: 0.25,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      wrapWithModel(
                        model: _model.consentBoxModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ConsentBoxWidget(
                          title: (_model.consent?.fileUrl.elementAtOrNull(1))
                              ?.title,
                          subTitle: 'AMDHA',
                          consentInfo: '',
                          showCheckBox: !widget.isFromMenu,
                          pdfPath: (_model.consent?.fileUrl.elementAtOrNull(1))
                              ?.path,
                          actionCallback: () async {
                            logFirebaseEvent(
                                'CONSENT_SCREEN_Container_53qwp20g_CALLBA');
                            _model.isCheckbox2Checked =
                                !_model.isCheckbox2Checked;
                            safeSetState(() {});
                          },
                        ),
                      ),
                      Divider(
                        height: 0.0,
                        thickness: 0.25,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      wrapWithModel(
                        model: _model.consentBoxModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: ConsentBoxWidget(
                          title: (_model.consent?.fileUrl.elementAtOrNull(2))
                              ?.title,
                          subTitle: 'AMDHA',
                          consentInfo: '',
                          showCheckBox: !widget.isFromMenu,
                          pdfPath: (_model.consent?.fileUrl.elementAtOrNull(2))
                              ?.path,
                          actionCallback: () async {
                            logFirebaseEvent(
                                'CONSENT_SCREEN_Container_b154s78n_CALLBA');
                            _model.isCheckbox3Checked =
                                !_model.isCheckbox3Checked;
                            safeSetState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Divider(
                      height: 0.0,
                      thickness: 0.25,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: (widget.isFromMenu
                                ? true
                                : !((_model.isCheckbox1Checked == true) &&
                                    (_model.isCheckbox2Checked == true) &&
                                    (_model.isCheckbox3Checked == true)))
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'CONSENT_SCREEN_Button_m7bdsynv_ON_TAP');

                                context.pushNamed(
                                  AdditionalDetailsScreenWidget.routeName,
                                  queryParameters: {
                                    'isUpdate': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                        text: widget.isFromMenu
                            ? 'Accepted'
                            : 'Agree & Continue',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                          disabledColor: Color(0xFF949494),
                        ),
                      ),
                    ),
                  ],
                ),
              ].addToEnd(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
