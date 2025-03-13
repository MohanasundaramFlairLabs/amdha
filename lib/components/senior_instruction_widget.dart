import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'senior_instruction_model.dart';
export 'senior_instruction_model.dart';

class SeniorInstructionWidget extends StatefulWidget {
  const SeniorInstructionWidget({
    super.key,
    this.task,
  });

  final TasksStruct? task;

  @override
  State<SeniorInstructionWidget> createState() =>
      _SeniorInstructionWidgetState();
}

class _SeniorInstructionWidgetState extends State<SeniorInstructionWidget> {
  late SeniorInstructionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeniorInstructionModel());

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
                      width: 50.0,
                      height: 50.0,
                      child: custom_widgets.TaskImageWidget(
                        width: 50.0,
                        height: 50.0,
                        taskType:
                            widget.task?.config.type == 'wellness_welcome'
                                ? 'program_booking'
                                : 'wellness_end',
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: true
                          ? null
                          : () {
                              print('Button pressed ...');
                            },
                      text: valueOrDefault<String>(
                        widget.task?.config.configData.label,
                        '-',
                      ),
                      options: FFButtonOptions(
                        height: 30.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.task?.config.configData.title,
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
                          widget.task?.config.configData.description,
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
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'SENIOR_INSTRUCTION_COMP_OK_BTN_ON_TAP');
                        _model.apiResultopop3 =
                            await TaskGroup.submittaskCall.call(
                          userId: FFAppState().userId,
                          baseurl: FFAppState().baseUrl,
                          jsonJson: functions.createtaskResponse(
                              widget.task?.taskType, '', widget.task!.id),
                        );

                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          HomePageWidget.routeName,
                          queryParameters: {
                            'index': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'isFromNotification': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'taskId': serializeParam(
                              '',
                              ParamType.String,
                            ),
                            'doScan': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );

                        safeSetState(() {});
                      },
                      text: 'Ok',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                  ].divide(SizedBox(width: 20.0)),
                ),
              ),
            ),
          ].divide(SizedBox(height: 20.0)).addToEnd(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
