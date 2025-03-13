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
import 'symptom_tracker_launch_page_model.dart';
export 'symptom_tracker_launch_page_model.dart';

class SymptomTrackerLaunchPageWidget extends StatefulWidget {
  const SymptomTrackerLaunchPageWidget({
    super.key,
    this.task,
    bool? onlyRecommendation,
  }) : this.onlyRecommendation = onlyRecommendation ?? false;

  final TasksStruct? task;
  final bool onlyRecommendation;

  static String routeName = 'SymptomTrackerLaunchPage';
  static String routePath = '/symptomTrackerLaunchPage';

  @override
  State<SymptomTrackerLaunchPageWidget> createState() =>
      _SymptomTrackerLaunchPageWidgetState();
}

class _SymptomTrackerLaunchPageWidgetState
    extends State<SymptomTrackerLaunchPageWidget> {
  late SymptomTrackerLaunchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SymptomTrackerLaunchPageModel());

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
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                FFAppState().theme.backgroudPrimaryColor,
                Color(0x143894B5),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if ((widget.task?.config.category != 'Blood Pressure') &&
                      (widget.task?.config.category != 'Body Temperature'))
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/symptom_push.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.35,
                        fit: BoxFit.fill,
                      ),
                    ),
                  if (widget.task?.config.category == 'Body Temperature')
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/body_temperature.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        fit: BoxFit.fill,
                      ),
                    ),
                  if (widget.task?.config.category == 'Blood Pressure')
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/blood_pressure.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        fit: BoxFit.fill,
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 100.0, 0.0),
                    child: Text(
                      'Your ${widget.task?.config.category} is ${widget.task?.config.severity}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nevermind',
                            color: Color(0xFFC03744),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w900,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Nevermind'),
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
                    child: Text(
                      'Let your doctor know how you feel right now!',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final list = functions
                                .getRecommendations(
                                    widget.task!.config.category,
                                    widget.task!.config.severity)
                                .toList();

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(list.length, (listIndex) {
                                  final listItem = list[listIndex];
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Icon(
                                            Icons.check,
                                            color: valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            size: 24.0,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listItem.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nevermind',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Nevermind'),
                                                      ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                listItem.content,
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nevermind',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Nevermind'),
                                                    ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  );
                                }).divide(SizedBox(height: 20.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SYMPTOM_TRACKER_LAUNCH_ADD_SYMPTOMS_BTN_');
                            if (widget.onlyRecommendation) {
                              _model.apiResultopop =
                                  await TaskGroup.submittaskCall.call(
                                userId: FFAppState().userId,
                                baseurl: FFAppState().baseUrl,
                                jsonJson: functions.createtaskResponse(
                                    widget.task?.taskType,
                                    '',
                                    widget.task!.id),
                              );

                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                HomePageWidget.routeName,
                                queryParameters: {
                                  'index': serializeParam(
                                    1,
                                    ParamType.int,
                                  ),
                                  'doScan': serializeParam(
                                    false,
                                    ParamType.bool,
                                  ),
                                  'isFromNotification': serializeParam(
                                    false,
                                    ParamType.bool,
                                  ),
                                  'taskId': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              context.pushNamed(
                                SymptomTrackerWidget.routeName,
                                queryParameters: {
                                  'category': serializeParam(
                                    widget.task?.config.category,
                                    ParamType.String,
                                  ),
                                  'severity': serializeParam(
                                    widget.task?.config.severity,
                                    ParamType.String,
                                  ),
                                  'taskId': serializeParam(
                                    widget.task?.id,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }

                            safeSetState(() {});
                          },
                          text: widget.onlyRecommendation
                              ? 'Close'
                              : 'Add Symptoms',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 50.0,
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
                                  fontFamily: 'Nevermind',
                                  color: valueOrDefault<Color>(
                                    FFAppState().theme.secondaryColor,
                                    FlutterFlowTheme.of(context).secondary,
                                  ),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nevermind'),
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
                        if (!widget.onlyRecommendation)
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SYMPTOM_TRACKER_LAUNCH_ILL_DO_IT_LATER_B');
                              context.safePop();
                            },
                            text: 'I\'ll do it later',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x00FF4343),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nevermind',
                                    color: valueOrDefault<Color>(
                                      FFAppState().theme.primaryColor,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nevermind'),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
