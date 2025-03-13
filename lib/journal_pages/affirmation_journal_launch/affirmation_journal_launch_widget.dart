import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'affirmation_journal_launch_model.dart';
export 'affirmation_journal_launch_model.dart';

class AffirmationJournalLaunchWidget extends StatefulWidget {
  const AffirmationJournalLaunchWidget({
    super.key,
    this.title,
    this.subTitle,
    this.secondaryTitle,
    this.listOfSuggetions,
    this.buttonTitle,
    this.task,
  });

  final String? title;
  final String? subTitle;
  final String? secondaryTitle;
  final List<String>? listOfSuggetions;
  final String? buttonTitle;
  final TasksStruct? task;

  static String routeName = 'AffirmationJournalLaunch';
  static String routePath = '/affirmationJournalLaunch';

  @override
  State<AffirmationJournalLaunchWidget> createState() =>
      _AffirmationJournalLaunchWidgetState();
}

class _AffirmationJournalLaunchWidgetState
    extends State<AffirmationJournalLaunchWidget> {
  late AffirmationJournalLaunchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AffirmationJournalLaunchModel());

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
                  decoration: BoxDecoration(
                    color: Color(0x58FFF4EF),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            widget.task?.taskType == 'journal'
                                ? 'Your Reflection Space'
                                : 'Positive affirmations',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Color(0xFF242E49),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
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
                                'AFFIRMATION_JOURNAL_LAUNCH_Container_iiq');
                            context.safePop();
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Icon(
                              Icons.close_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 2.0,
                  thickness: 0.5,
                  color: Color(0xFFDFDFDF),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.task?.taskType == 'journal')
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Png_high_quality.png',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (widget.task?.taskType == 'affirmations')
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/positive_affirmation.png',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            fit: BoxFit.fill,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 7.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.title,
                              '-',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.subTitle,
                              '-',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 39.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.secondaryTitle,
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 40.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final suggestion =
                                      widget.listOfSuggetions?.toList() ?? [];

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(suggestion.length,
                                          (suggestionIndex) {
                                        final suggestionItem =
                                            suggestion[suggestionIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.05,
                                                decoration: BoxDecoration(),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Opacity(
                                                  opacity: 0.5,
                                                  child: Text(
                                                    (int index) {
                                                      return '${index + 1}';
                                                    }(suggestionIndex),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FFAppState()
                                                              .theme
                                                              .primaryColor,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.65,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  suggestionItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'AFFIRMATION_JOURNAL_LAUNCH_START_JOURNAL');
                              if (widget.task?.taskType == 'affirmations') {
                                if (widget
                                        .task?.config.questions.firstOrNull ==
                                    null) {
                                  _model.submitaffirmationwithoutquestion =
                                      await TaskGroup.submitAffirmationsCall
                                          .call(
                                    uniqueId: widget.task?.config.type,
                                    userId: FFAppState().userId,
                                    baseurl: FFAppState().baseUrl,
                                    answerJson: <String, List<String>?>{
                                      'selectedOptions': [],
                                    },
                                  );

                                  if ((_model.submitaffirmationwithoutquestion
                                          ?.succeeded ??
                                      true)) {
                                    context.pushNamed(
                                      PositiveAffirmationAnimationWidget
                                          .routeName,
                                      queryParameters: {
                                        'affirmations': serializeParam(
                                          functions.convertIntoListofString(
                                              getJsonField(
                                            (_model.submitaffirmationwithoutquestion
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data''',
                                          )),
                                          ParamType.String,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                    );

                                    _model.apiResulto25 =
                                        await TaskGroup.submittaskCall.call(
                                      jsonJson: functions.createtaskResponse(
                                          widget.task?.taskType,
                                          '',
                                          widget.task!.id),
                                      userId: FFAppState().userId,
                                      baseurl: FFAppState().baseUrl,
                                    );
                                  }
                                } else {
                                  context.pushNamed(
                                    AffirmationsWidget.routeName,
                                    queryParameters: {
                                      'task': serializeParam(
                                        widget.task,
                                        ParamType.DataStruct,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              } else {
                                context.pushNamed(
                                  JournalQuestionPageWidget.routeName,
                                  queryParameters: {
                                    'question': serializeParam(
                                      widget.task?.config.questions
                                          .firstOrNull?.question,
                                      ParamType.String,
                                    ),
                                    'taskId': serializeParam(
                                      widget.task?.id,
                                      ParamType.String,
                                    ),
                                    'uniqueId': serializeParam(
                                      widget.task?.config.type,
                                      ParamType.String,
                                    ),
                                    'isFromTask': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'taskType': serializeParam(
                                      widget.task?.taskType,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              }

                              safeSetState(() {});
                            },
                            text: widget.buttonTitle!,
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FFAppState().theme.primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
