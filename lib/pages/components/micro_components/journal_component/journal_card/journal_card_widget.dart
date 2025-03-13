import '';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/micro_components/delete_dialog_box/delete_dialog_box_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_card_model.dart';
export 'journal_card_model.dart';

class JournalCardWidget extends StatefulWidget {
  const JournalCardWidget({
    super.key,
    this.question,
    this.answerOne,
    this.date,
    this.answerTwo,
    this.answerThree,
    this.id,
  });

  final String? question;
  final String? answerOne;
  final String? date;
  final String? answerTwo;
  final String? answerThree;
  final String? id;

  @override
  State<JournalCardWidget> createState() => _JournalCardWidgetState();
}

class _JournalCardWidgetState extends State<JournalCardWidget> {
  late JournalCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalCardModel());

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

    return Stack(
      alignment: AlignmentDirectional(1.0, 1.0),
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('JOURNAL_CARD_Container_iqasyeoq_ON_TAP');
            _model.isOption = false;
            safeSetState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: Color(0x255D6A85),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget.question!,
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                if (widget.answerOne != null && widget.answerOne != '')
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Color(0x265D6A85),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          widget.answerOne!,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                if (widget.answerTwo != null && widget.answerTwo != '')
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Color(0x265D6A85),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          widget.answerTwo!,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                if (widget.answerThree != null && widget.answerThree != '')
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Color(0x265D6A85),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          widget.answerThree!,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0x155D6A85),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    dateTimeFormat(
                                      "MMMMEEEEd",
                                      functions
                                          .convertStringToDate(widget.date!),
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (false)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'JOURNAL_CARD_Container_s43z3glu_ON_TAP');
                              _model.apiResultlbz =
                                  await HocGroup.deleteJournalCall.call(
                                userId: FFAppState().userId,
                                baseurl: FFAppState().baseUrl,
                                id: widget.id,
                              );

                              if ((_model.apiResultlbz?.succeeded ?? true)) {
                                FFAppState().clearFetchJournalQueryCache();
                                FFAppState().refresh =
                                    !(FFAppState().refresh ?? true);
                                FFAppState().update(() {});
                              }

                              safeSetState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Icon(
                                FFIcons.kdelete,
                                color: Color(0xFF706F6F),
                                size: 24.0,
                              ),
                            ),
                          ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'JOURNAL_CARD_COMP_Icon_a55e9fgp_ON_TAP');
                            _model.isOption = true;
                            safeSetState(() {});
                          },
                          child: Icon(
                            FFIcons.ksolarMenuDotsBold,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_model.isOption)
          Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: Container(
              width: 80.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: AlignmentDirectional(1.0, 1.0),
              child: Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('JOURNAL_CARD_COMP_DELETE_BTN_ON_TAP');
                    await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: Container(
                            height: 200.0,
                            width: 320.0,
                            child: DeleteDialogBoxWidget(
                              fileId: widget.id,
                              type: ' ',
                              message:
                                  'Are you sure you want to delete this Journal?',
                              deleteAction: (id, type) async {
                                _model.apiResultlbzCopy =
                                    await HocGroup.deleteJournalCall.call(
                                  userId: FFAppState().userId,
                                  baseurl: FFAppState().baseUrl,
                                  id: id,
                                );

                                if ((_model.apiResultlbzCopy?.succeeded ??
                                    true)) {
                                  FFAppState().clearFetchJournalQueryCache();
                                  FFAppState().refresh =
                                      !(FFAppState().refresh ?? true);
                                  FFAppState().update(() {});
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    );

                    safeSetState(() {});
                  },
                  text: 'Delete',
                  icon: Icon(
                    FFIcons.kdelete,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: 80.0,
                    height: 30.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  showLoadingIndicator: false,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
