import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/journal_component/journal_card/journal_card_widget.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/pages/components/shimmer_components/journal_shimmer/journal_shimmer_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_component_model.dart';
export 'journal_component_model.dart';

class JournalComponentWidget extends StatefulWidget {
  const JournalComponentWidget({
    super.key,
    this.backAction,
  });

  final Future Function()? backAction;

  @override
  State<JournalComponentWidget> createState() => _JournalComponentWidgetState();
}

class _JournalComponentWidgetState extends State<JournalComponentWidget> {
  late JournalComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalComponentModel());

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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
      ),
      child: Stack(
        alignment: AlignmentDirectional(1.0, 1.0),
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 56.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                              'JOURNAL_COMPONENT_Container_hmmll915_ON_');
                          context.safePop();
                        },
                        child: Container(
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Journal',
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
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<ApiCallResponse>(
                    future: FFAppState().fetchJournalQuery(
                      uniqueQueryKey: FFAppConstants.FetchJournalQuery,
                      requestFn: () => HocGroup.getJournalCall.call(
                        userId: FFAppState().userId,
                        baseurl: FFAppState().baseUrl,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return JournalShimmerWidget();
                      }
                      final columnGetJournalResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final journals = JournalModelStruct.maybeFromMap(
                                      columnGetJournalResponse.jsonBody)
                                  ?.journalEntries
                                  .toList() ??
                              [];
                          if (journals.isEmpty) {
                            return NoDataComponentWidget(
                              name: 'Journal',
                            );
                          }

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(journals.length,
                                      (journalsIndex) {
                                final journalsItem = journals[journalsIndex];
                                return JournalCardWidget(
                                  key: Key(
                                      'Keyhva_${journalsIndex}_of_${journals.length}'),
                                  question: journalsItem.question.question,
                                  answerOne: journalsItem.answer,
                                  date: journalsItem.createdAt,
                                  answerTwo: journalsItem.secondAnswer,
                                  answerThree: journalsItem.thirdAnswer,
                                  id: journalsItem.id,
                                );
                              })
                                  .divide(SizedBox(height: 20.0))
                                  .addToStart(SizedBox(height: 20.0))
                                  .addToEnd(SizedBox(height: 80.0)),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 20.0),
            child: FlutterFlowIconButton(
              borderColor: valueOrDefault<Color>(
                FFAppState().theme.primaryColor,
                FlutterFlowTheme.of(context).primary,
              ),
              borderRadius: 288.0,
              borderWidth: 1.0,
              buttonSize: 56.0,
              fillColor: valueOrDefault<Color>(
                FFAppState().theme.primaryColor,
                FlutterFlowTheme.of(context).primary,
              ),
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).secondary,
                size: 32.0,
              ),
              onPressed: () async {
                logFirebaseEvent('JOURNAL_COMPONENT_COMP_add_ICN_ON_TAP');
                _model.apiResultetj = await HocGroup.getQuestionCall.call(
                  userId: FFAppState().userId,
                  baseurl: FFAppState().baseUrl,
                  activity: 'journal',
                );

                if ((_model.apiResultetj?.succeeded ?? true)) {
                  context.pushNamed(
                    JournalQuestionPageWidget.routeName,
                    queryParameters: {
                      'question': serializeParam(
                        getJsonField(
                          (_model.apiResultetj?.jsonBody ?? ''),
                          r'''$.question[:].question''',
                        ).toString(),
                        ParamType.String,
                      ),
                      'taskId': serializeParam(
                        '',
                        ParamType.String,
                      ),
                      'uniqueId': serializeParam(
                        getJsonField(
                          (_model.apiResultetj?.jsonBody ?? ''),
                          r'''$.question[:].uniqueIdentifier''',
                        ).toString(),
                        ParamType.String,
                      ),
                      'isFromTask': serializeParam(
                        false,
                        ParamType.bool,
                      ),
                      'taskType': serializeParam(
                        '',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Error fetching the question',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                }

                safeSetState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
