import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'consent_box_model.dart';
export 'consent_box_model.dart';

class ConsentBoxWidget extends StatefulWidget {
  const ConsentBoxWidget({
    super.key,
    this.title,
    this.subTitle,
    this.consentInfo,
    this.actionCallback,
    bool? showCheckBox,
    this.pdfPath,
  }) : this.showCheckBox = showCheckBox ?? false;

  final String? title;
  final String? subTitle;
  final String? consentInfo;
  final Future Function()? actionCallback;
  final bool showCheckBox;
  final String? pdfPath;

  @override
  State<ConsentBoxWidget> createState() => _ConsentBoxWidgetState();
}

class _ConsentBoxWidgetState extends State<ConsentBoxWidget> {
  late ConsentBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsentBoxModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 75.0,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                    unselectedWidgetColor: Color(0xA8000000),
                  ),
                  child: Checkbox(
                    value: _model.consentValue ??=
                        widget.showCheckBox ? false : true,
                    onChanged: !widget.showCheckBox
                        ? null
                        : (newValue) async {
                            safeSetState(() => _model.consentValue = newValue!);
                            if (newValue!) {
                              logFirebaseEvent(
                                  'CONSENT_BOX_COMP_Consent_ON_TOGGLE_ON');
                              await widget.actionCallback?.call();
                            } else {
                              logFirebaseEvent(
                                  'CONSENT_BOX_COMP_Consent_ON_TOGGLE_OFF');
                              await widget.actionCallback?.call();
                            }
                          },
                    side: BorderSide(
                      width: 2,
                      color: Color(0xA8000000),
                    ),
                    activeColor: Colors.black,
                    checkColor: !widget.showCheckBox
                        ? null
                        : FlutterFlowTheme.of(context).info,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.title,
                                  'title',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nevermind',
                                      color: Color(0xFF141928),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nevermind'),
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.subTitle,
                                  'Sub Title',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              FFAppState().theme.backgroudPrimaryColor,
                              Color(0x1A3894B5),
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'CONSENT_BOX_COMP_Row_x5lc088r_ON_TAP');

                              context.pushNamed(
                                PdfPreviewPageWidget.routeName,
                                queryParameters: {
                                  'pdfuri': serializeParam(
                                    widget.pdfPath,
                                    ParamType.String,
                                  ),
                                  'title': serializeParam(
                                    widget.title,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kpdf,
                                  color: valueOrDefault<Color>(
                                    FFAppState().theme.primaryColor,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  size: 20.0,
                                ),
                                Text(
                                  'View',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nevermind',
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nevermind'),
                                      ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(width: 10.0))
                  .addToStart(SizedBox(width: 20.0))
                  .addToEnd(SizedBox(width: 20.0)),
            ),
          ),
        ],
      ),
    );
  }
}
